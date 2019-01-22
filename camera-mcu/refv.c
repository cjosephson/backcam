/*
 * Dynamic Reference Voltage for BackCam
 *
 * Pin Map
 *
 * 430  | Camera
 * P4.0 - Comparator
 */

#include <driverlib.h>

void init_uart();
void dac_init();
void dac_write(uint16_t dac_val);

volatile uint8_t next_is_rising = 0;
volatile uint8_t past_edge = 0; // 0 - not an edge, 1 - rising edge, 2 - falling edge

void main(void)
{
    WDT_A_hold(WDT_A_BASE);     // disable watchdog
    PMM_unlockLPM5();           // unlock pins from high impedance state

    /* set SMCLK to 4M, Master CLK (CPU) to 8M */
    CSCTL0_H = 0xA5;            // unlock clock control regs
    CSCTL1_L = 0b01000110;      // set DCO freq to 8m
    CSCTL3_L = 0b00010000;      // set SMCLK divider to 2x, MCLK divider to 1x

    /* enable interrupt for comparator detection */
    P4DIR &= 0b11111110;        // set P4.0 as input (comparator input from radio board)
    P4IFG &= 0b11111110;        // clear P4.0 irq flag
    P4IE  |= 0b00000001;        // enable P4.0 interrupt. note that the global switch of irq is not on yet
    P4IES &= 0b11111110;        // set P4.0 to trigger irq at rising edge

    /* set reference voltage output */
    dac_init();                 // init DAC interface (SPI)
    dac_write(24500);           // write refv

    init_uart();
    __enable_interrupt();

    while (1)
    {
#ifdef UARTDUMP /* dumping to serial port */
            /* transmit 'A' 16 times indicating the beginning of a frame */
            uint32_t i = 0;
            for (i = 0; i < 16; i++) {
                EUSCI_A_UART_transmitData(EUSCI_A1_BASE, 65);  /* transmit 'A' */
            }
            /* transmit the entire image buffer */
            uint8_t* uart_data_ptr = img_buffer;
            uint32_t uart_pixel_number = 0;
            if (image_res == 1) {
                uart_pixel_number = 159087;
            }
            else {
                uart_pixel_number = 40015;
            }
            for (i = 0; i < uart_pixel_number; i++) {
                EUSCI_A_UART_transmitData(EUSCI_A1_BASE, *(uart_data_ptr++));
            }
            EUSCI_A_UART_transmitBreak(EUSCI_A1_BASE);  /* send the last byte with stop bit */
            EUSCI_A_UART_transmitData(EUSCI_A1_BASE, *(uart_data_ptr++));
#endif  /* ifdef UARTDUMP */
    }
}

void dac_init()
{
    /* set P7.0 and P7.2 to UCB2 SPI mode */
    P7SEL0 |= 0b00000101;
    P7SEL1 &= 0b11111010;
    /* set P2.1 to output (CS pin) */
    P2OUT  |= 0b00000010;   // CS pin is low active, so keep it high first
    P2DIR  |= 0b00000010;
    /* configure eUSCI_B2 SPI */
    /* reset spi */
    EUSCI_B_SPI_disable(EUSCI_B2_BASE);
    /* prepare spi master config */
    EUSCI_B_SPI_initMasterParam master_config = {EUSCI_B_SPI_CLOCKSOURCE_SMCLK,     // source clock from SMCLK
                                                 CS_getSMCLK(),                     // get clock speed from SMCLK
                                                 4000000,                           // set SPI clock speed to maximum
                                                 EUSCI_B_SPI_MSB_FIRST,             // set msb first
                                                 EUSCI_B_SPI_PHASE_DATA_CAPTURED_ONFIRST_CHANGED_ON_NEXT,
                                                 EUSCI_B_SPI_CLOCKPOLARITY_INACTIVITY_LOW,  // set CKPH=1, CKPL=0
                                                 EUSCI_B_SPI_3PIN};                 // set to 3-wire mode
    EUSCI_B_SPI_initMaster(EUSCI_B2_BASE, &master_config);
    EUSCI_B_SPI_enable(EUSCI_B2_BASE);
}

void dac_write(uint16_t dac_val)
{
    uint8_t hibyte, lobyte;
    hibyte = (dac_val >> 8) & 0x00FF;
    lobyte = dac_val & 0x00FF;
    P2OUT &= 0b11111101;    // set cs to low, start transmission
    while (EUSCI_B_SPI_isBusy(EUSCI_B2_BASE));          // wait for spi to free
    EUSCI_B_SPI_transmitData(EUSCI_B2_BASE, hibyte);    // transmit high byte
    while (EUSCI_B_SPI_isBusy(EUSCI_B2_BASE));          // wait for high byte to be sent
    EUSCI_B_SPI_transmitData(EUSCI_B2_BASE, lobyte);    // transmit high byte
    while (EUSCI_B_SPI_isBusy(EUSCI_B2_BASE));          // wait for tx to complete
    P2OUT |= 0b00000010;                                // pull up cs, transmission complete
    return;
}

void init_uart()
{
    /* set UART pin function */
    GPIO_setAsPeripheralModuleFunctionInputPin(
        GPIO_PORT_P2,
        GPIO_PIN5 + GPIO_PIN6,
        GPIO_SECONDARY_MODULE_FUNCTION
    );

    /* reset UART module */
    EUSCI_A_UART_disable(EUSCI_A1_BASE);

    /* prepare UART configuration struct */
    EUSCI_A_UART_initParam param = {0};
    param.selectClockSource = EUSCI_A_UART_CLOCKSOURCE_SMCLK;
    param.clockPrescalar = 17;
    param.firstModReg = 17;
    param.secondModReg = 0x4A;
    param.parity = EUSCI_A_UART_NO_PARITY;
    param.msborLsbFirst = EUSCI_A_UART_LSB_FIRST;
    param.numberofStopBits = EUSCI_A_UART_ONE_STOP_BIT;
    param.uartMode = EUSCI_A_UART_MODE;
    param.overSampling = EUSCI_A_UART_LOW_FREQUENCY_BAUDRATE_GENERATION;

    /* configure UART module and enable it */
    EUSCI_A_UART_init(EUSCI_A1_BASE, &param);
    EUSCI_A_UART_enable(EUSCI_A1_BASE);
    EUSCI_A_UART_clearInterrupt(EUSCI_A1_BASE, EUSCI_A_UART_RECEIVE_INTERRUPT);
    return;
}

#pragma vector=PORT4_VECTOR
__interrupt
void PORT4_ISR()
{
    P4IE  &= 0b11111110;            // disable P4.0 interrupt
    P4IFG &= 0b11111110;            // clear P4.0 irq flag
    if (next_is_rising) {
        P4IES &= 0b11111110;        // set P4.0 to trigger irq at rising edge
        past_edge = 2;              // we just passed a falling edge
    }
    else {
        P4IES |= 0b00000001;        // set P4.0 to trigger irq at falling edge
        past_edge = 1;              // we just passed a rising edge
    }
    next_is_rising = !next_is_rising;
    P4IE  |= 0b00000011;            // re-enable P4.0 interrupt
}
