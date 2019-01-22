/*******************************************************************************
 *
 *  HAL_SDCard.c - Driver for the SD Card slot
 *
 *  Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************/

/***************************************************************************//**
 * @file       HAL_SDCard.c
 * @addtogroup HAL_SDCard
 * @{
 ******************************************************************************/
#include "HAL_SDCard.h"
#include "driverlib.h"

// Pins from MSP430 connected to the SD Card
#define SPI_SIMO        BIT6
#define SPI_SOMI        BIT7
#define SPI_CLK         BIT2
#define SD_CS           BIT0

// Ports
#define SPI_SEL         P1SEL1
#define SPI_DIR         P1DIR
#define SPI_OUT         P1OUT
#define SPI_REN         P1REN
#define SD_CS_SEL       P2SEL1
#define SD_CS_OUT       P2OUT
#define SD_CS_DIR       P2DIR

#define CLOCK_FREQ             4000000
#define DESIRED_SPI_FREQ       400000
#define DESIRED_SPI_FAST_FREQ  4000000

SDCardLib_Interface sdIntf_MSP430FR5994LP = {
		CLOCK_FREQ,
		SDCard_init,
		SDCard_fastMode,
		SDCard_readFrame,
		SDCard_sendFrame,
		SDCard_setCSHigh,
		SDCard_setCSLow,
		SDCard_detectCard,
		SDCard_getRTCTime,
		SDCard_setRTCTime
};

/***************************************************************************//**
 * @brief   Initialize SD Card
 * @param   None
 * @return  None
 ******************************************************************************/

void SDCard_init(void)
{
    //Configure Pins for UCB0CLK
    GPIO_setAsPeripheralModuleFunctionInputPin(
        GPIO_PORT_P2,
        GPIO_PIN2,
        GPIO_SECONDARY_MODULE_FUNCTION
    );

    //Configure Pins for UCB0TXD/UCB0SIMO, UCB0RXD/UCB0SOMI
    GPIO_setAsPeripheralModuleFunctionInputPin(
        GPIO_PORT_P1,
        GPIO_PIN6 + GPIO_PIN7,
        GPIO_SECONDARY_MODULE_FUNCTION
    );

    //Set CS pin high
    GPIO_setOutputHighOnPin(
        GPIO_PORT_P2,
        GPIO_PIN0
        );
    //Set CS pin as output pin
    GPIO_setAsOutputPin(
        GPIO_PORT_P2,
        GPIO_PIN0
        );

    //Initialize Master
	EUSCI_B_SPI_initMasterParam param = {0};
    param.selectClockSource = EUSCI_B_SPI_CLOCKSOURCE_SMCLK;
    param.clockSourceFrequency = CLOCK_FREQ;
    param.desiredSpiClock = DESIRED_SPI_FREQ;
    param.msbFirst = EUSCI_B_SPI_MSB_FIRST;
    param.clockPhase = EUSCI_B_SPI_PHASE_DATA_CHANGED_ONFIRST_CAPTURED_ON_NEXT;
    param.clockPolarity = EUSCI_B_SPI_CLOCKPOLARITY_INACTIVITY_HIGH;
    param.spiMode = EUSCI_B_SPI_3PIN;
    EUSCI_B_SPI_initMaster(EUSCI_B0_BASE, &param);

    //Enable SPI module
    EUSCI_B_SPI_enable(EUSCI_B0_BASE);

    //Clear RXIFG interrupt flag
    EUSCI_B_SPI_clearInterrupt(EUSCI_B0_BASE, EUSCI_B_SPI_RECEIVE_INTERRUPT);
}

/***************************************************************************//**
 * @brief   Enable fast SD Card SPI transfers. This function is typically
 *          called after the initial SD Card setup is done to maximize
 *          transfer speed.
 * @param   None
 * @return  None
 ******************************************************************************/

void SDCard_fastMode(void)
{
	EUSCI_B_SPI_changeMasterClockParam param = {0};
	param.clockSourceFrequency = CLOCK_FREQ;
	param.desiredSpiClock = DESIRED_SPI_FAST_FREQ;
	EUSCI_B_SPI_changeMasterClock(EUSCI_B0_BASE, &param);
}

/***************************************************************************//**
 * @brief   Read a frame of bytes via SPI
 * @param   pBuffer Place to store the received bytes
 * @param   size Indicator of how many bytes to receive
 * @return  None
 ******************************************************************************/

void SDCard_readFrame(uint8_t *pBuffer, uint16_t size)
{
    uint16_t gie = __get_SR_register() & GIE;              // Store current GIE state

    __disable_interrupt();                                 // Make this operation atomic

    // Ensure RXIFG is clear
    EUSCI_B_SPI_clearInterrupt(EUSCI_B0_BASE, EUSCI_B_SPI_RECEIVE_INTERRUPT);

    // Clock the actual data transfer and receive the bytes
    while (size--){
    	// Wait while not ready for TX
    	while(!EUSCI_B_SPI_getInterruptStatus(EUSCI_B0_BASE, EUSCI_B_SPI_TRANSMIT_INTERRUPT));
    	// Write dummy byte
    	EUSCI_B_SPI_transmitData(EUSCI_B0_BASE, 0xff);
    	// Wait for RX buffer (full)
    	while(!EUSCI_B_SPI_getInterruptStatus(EUSCI_B0_BASE, EUSCI_B_SPI_RECEIVE_INTERRUPT));
    	*pBuffer++ = EUSCI_B_SPI_receiveData(EUSCI_B0_BASE);
    }

    __bis_SR_register(gie);                                // Restore original GIE state
}

/***************************************************************************//**
 * @brief   Send a frame of bytes via SPI
 * @param   pBuffer Place that holds the bytes to send
 * @param   size Indicator of how many bytes to send
 * @return  None
 ******************************************************************************/

void SDCard_sendFrame(uint8_t *pBuffer, uint16_t size)
{
    uint16_t gie = __get_SR_register() & GIE;              // Store current GIE state

    __disable_interrupt();                                 // Make this operation atomic

    // Clock the actual data transfer and send the bytes. Note that we
    // intentionally not read out the receive buffer during frame transmission
    // in order to optimize transfer speed, however we need to take care of the
    // resulting overrun condition.
    while (size--){
    	// Wait while not ready for TX
    	while(!EUSCI_B_SPI_getInterruptStatus(EUSCI_B0_BASE, EUSCI_B_SPI_TRANSMIT_INTERRUPT));
    	// Write byte
    	EUSCI_B_SPI_transmitData(EUSCI_B0_BASE, *pBuffer++);
    }
    // Wait for all TX/RX to finish
    while(EUSCI_B_SPI_isBusy(EUSCI_B0_BASE));

    // Dummy read to empty RX buffer
    // and clear any overrun conditions
    EUSCI_B_SPI_receiveData(EUSCI_B0_BASE);

    __bis_SR_register(gie);                                // Restore original GIE state
}

/***************************************************************************//**
 * @brief   Set the SD Card's chip-select signal to high
 * @param   None
 * @return  None
 ******************************************************************************/

void SDCard_setCSHigh(void)
{
    GPIO_setOutputHighOnPin(
        GPIO_PORT_P2,
        GPIO_PIN0
        );
}

/***************************************************************************//**
 * @brief   Set the SD Card's chip-select signal to low
 * @param   None
 * @return  None
 ******************************************************************************/

void SDCard_setCSLow(void)
{
    GPIO_setOutputLowOnPin(
        GPIO_PORT_P2,
        GPIO_PIN0
        );
}

SDCardLib_Status SDCard_detectCard(void)
{
    //Pull-up resistor for SD detect pin
    //Pulled low if SD is inserted
    /* we don't have this detect pin, always return true */
    /*
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P7, GPIO_PIN2);

	if (GPIO_getInputPinValue(GPIO_PORT_P7, GPIO_PIN2)) {
		return SDCARDLIB_STATUS_NOT_PRESENT;
	}
	else {
		return SDCARDLIB_STATUS_PRESENT;
	}*/
    return SDCARDLIB_STATUS_PRESENT;
}

Calendar SDCard_getRTCTime(void)
{
	return RTC_C_getCalendarTime(RTC_C_BASE);
}

void SDCard_setRTCTime(Calendar *curTime)
{
    //Initialize Calendar Mode of RTC
    RTC_C_initCalendar(RTC_C_BASE,
    		curTime,
			RTC_C_FORMAT_BINARY);

    //Start RTC Clock
    RTC_C_startClock(RTC_C_BASE);
}

/***************************************************************************//**
 * @}
 ******************************************************************************/
