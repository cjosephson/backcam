/*
 * Driver code for HiMax HM01B0 camera on TI MSP430FR5994 microcontroller
 *
 * Timing
 *
 *     -  CPU Core (MCLK)
 *     |     8M
 * DCO - (divider)- SMCLK - (divider)- I2C SCL
 * 8M      2x        4M   |   auto     100k
 *                        - Camera MCLK - (divider) - Core CLK       - PCLK = 2xCoreCLK = 1M
 *                              4M      |     8x         1/2M   ...
 *                                      - (divider) - Reg CLK
 *                                            1x          8M
 *
 * Pin Map
 *
 * 430  | Camera
 * P3.0 - D0
 * P3.1 - D1
 * P3.2 - D2
 * P3.3 - D3
 * P5.4 - TRIG
 * P1.0 - PCLK
 * P5.6 - MCLK
 * GND  - GND
 * 3V3  - VCC
 * P5.1 - SCL
 * P5.0 - SDA
 * P8.0 - VSYNC
 * P4.0 - Resolution Control
 */

#include <driverlib.h>
#include <sdcard.h>
#include <HAL_SDCard.h>

#define HM01B0ADDR 0x24 /* camera I2C address */

/* options */
/* note: HIRES and SDCARD should not be enabled at the same time */
//#define DEBUG           /* enable debug outputs like led and debug pins */
//#define HIRES           /* define this for 326x244 resolution, or it will be 164x122 */
#define TESTPATTERN     /* define this for test pattern (walking '1's) */
//#define SDCARD          /* define this for SD card dump */
#define UARTDUMP        /* define this to dump image to UART */
#define REFVOLTAGE      /* define this to let MSP output reference voltage */
#define MCLOCK          /* define this to let MSP output MCLK for the camera */
#define CAMTRIG         /* define this to let MSP output trigger signal for the camera */
#define DLKCTRL         /* define this to enable interrupt for down-link resolution control */


#if defined(SDCARD) || defined(UARTDUMP)
#define DUMPIMG
#endif

#ifdef SDCARD
SDCardLib sdCardLib;
FIL fil;        /* File object */
FRESULT rc;
UINT bw;
#endif

#ifdef UARTDUMP
void init_uart();
#endif

#ifdef DUMPIMG
#pragma PERSISTENT(img_buffer)
uint8_t img_buffer[159088] = {0};
volatile int dma_major_count;
volatile uint32_t dma_target_addr;

volatile uint8_t image_ready = 0;
volatile uint16_t img_cnt = 0;

void config_dma_hires();
void config_dma_lores();
#endif


#ifdef HIRES
volatile uint8_t image_res = 1; /* 0 for lores, 1 for hires */
#else
volatile uint8_t image_res = 0;
#endif

#ifdef DLKCTRL
volatile uint8_t pending_res_change = 0;
#endif

#ifdef REFVOLTAGE
void dac_init();
void dac_write(uint16_t dac_val);
#endif

void i2c_init();
void write_camera(uint16_t regaddr, uint8_t data);
uint8_t read_camera(uint16_t regaddr);
void write_verify_camera(uint16_t regaddr, uint8_t data);
void config_camera_hires();
void config_camera_lores();

void main(void)
{
    WDT_A_hold(WDT_A_BASE);     // disable watchdog
    PMM_unlockLPM5();           // unlock pins from high impedance state

    /* set SMCLK to 4M, Master CLK (CPU) to 8M */
    CSCTL0_H = 0xA5;            // unlock clock control regs
    CSCTL1_L = 0b01000110;      // set DCO freq to 8m
    CSCTL3_L = 0b00010000;      // set SMCLK divider to 2x, MCLK divider to 1x

#ifdef MCLOCK
    /* output SMCLK as MCLK for camera */
    P5DIR  |= 0b01000000;       // set P5.6 to output
    P5SEL1 |= 0b01000000;       // set P5.6 to SMCLK out
    P5SEL0 |= 0b01000000;
#endif

#ifdef CAMTRIG
    /* set TRIG signal to high */
    P5DIR |= 0b00010000;        // set P5.4 to output
    P5OUT |= 0b00010000;        // set P5.4 out to high
#endif

#ifdef DEBUG
    P4DIR |= 0b00001100;
#endif

#ifdef DUMPIMG
    /* set camera databus pin and FVLD pin to input mode */
    P3DIR &= 0b11110000;        // set P3.0-3 as input (camera data bus)
    P8DIR &= 0b11111110;        // set P8.0 as input (FVLD)
    P8IE  |= 0b00000001;        // enable P8.0 interrupt. note that the global switch of irq is not on yet
    P8IES &= 0b11111110;        // set P8.0 irq trigger at rising edge
    P8IFG &= 0b11111110;        // clear P8.0 irq flag
    /* set pin 1.0 function to DMAE0 input (DMA trigger) */
    P1DIR &= 0b11111110;
    P1SEL1 |= 0b00000001;
#endif
#ifdef DLKCTRL
    /* enable interrupt for resolution control pin */
    P4DIR &= 0b11111100;        // set P4.0/1 as input (resolution command from fpga)
    P4IFG &= 0b11111100;        // clear P4.0/1 irq flag
    P4IE  |= 0b00000011;        // enable P4.0 interrupt. note that the global switch of irq is not on yet
    P4IES &= 0b11111100;
    P4IES |= 0b00000010;        // set P4.0 to trigger at rising, and P4.1 at rising edge
    while (1) {
        image_res = P4IN & 0b00000011;
        if (((image_res ^ (image_res >> 1)) & 0b00000001) == 0) {
            /* wait until two input pins are the same */
            image_res = image_res & 0b00000001;
            break;
        }
    }
#endif

    __delay_cycles(400000);     // delay 0.05s

#ifdef REFVOLTAGE
    /* set reference voltage output */
    dac_init();                 // init DAC interface (SPI)
    dac_write(24500);           // write refv, dac_write = (volts/3.3)*65535.
                                // 24500 ~= 1.2V
    /* NOTE: dynamic reference voltage tuning was successful with a
       Teensy MCU. We ran out of time to port the changes to MSP430,
       but a dynamic tuning algorithm should also work on this MCU */
#endif


    /* configure himax camera */
    i2c_init();
    write_camera(0x0103, 0xff);         // reset camera
    __delay_cycles(800000);             // wait 0.1s for the camera to reset
    /* databus controls */
    write_camera(0x0100, 0b00000101);   // wake up from S/W stdby to external triggered mode
    write_camera(0x3059, 0b01000010);   // set data bus width = 4bit
    /* resolution and timing */
    write_camera(0x3010, 0b00000001);   // enable qvga timing
    if (image_res == 0) {               // if initialize as 164x122
        config_camera_lores();
    }
    else {                              // if 326x244
        config_camera_hires();
    }
    __delay_cycles(4000000);            // this magic delay is critical to setting the frame rate
#ifdef TESTPATTERN
    write_camera(0x0601, 0b00010001);   // enable test pattern (walking '1's)
#endif
#ifdef DUMPIMG
    write_camera(0x3060, 0b00111000);   // gated pclock, MSB first, main clock 8x div, reg clock 1x div
#else
    write_camera(0x3060, 0b00011000);   // ungated pclk, MSB first, main clock 8x div, reg clock 1x div
#endif

    __delay_cycles(400000);

#ifndef DUMPIMG  /* if we don't need to dump the image */
    /* the MCU can hibernate only when:
     * not dumping image to sd or uart; and
     * not generating MCLK; and
     * not generating trigger; and
     * not handling downlink resolution control */
#if !defined(MCLOCK) && !defined(CAMTRIG) && !defined(DLKCTRL)
    __bis_SR_register(LPM4_bits);
#endif  /* if !defined(MCLOCK) && !defined(CAMTRIG) */
    __enable_interrupt();
    while (1) {;}
#else   /* if we need to dump the image */

#ifdef SDCARD
    /* init sd card */
    SDCardLib_init(&sdCardLib, &sdIntf_MSP430FR5994LP);
    SDCardLib_detectCard(&sdCardLib); // we don't have a detector pin, so ignore the result

#ifdef DEBUG
    /* write SD card test file */
    rc = f_open(&fil, "sdstatus.txt", FA_WRITE | FA_CREATE_ALWAYS);
    f_puts("the sd card is okay", &fil);
    f_close(&fil);
#endif  /* DEBUG */
#endif  /* SDCARD */
#ifdef UARTDUMP
    init_uart();
#endif

    /* init dma configs */
    if (image_res == 1) {
        config_dma_hires();
    }
    else {
        config_dma_lores();
    }
    __enable_interrupt();

    while (1)
    {
        if (image_ready)
        {
#ifdef SDCARD   /* dumping to SDCARD */
            rc = f_open(&fil, "rawbmp.bin", FA_WRITE | FA_CREATE_ALWAYS);
            if (image_res == 1) {
                f_write(&fil, img_buffer, 159088, NULL);
            }
            else {
                f_write(&fil, img_buffer, 40016, NULL);
            }
            f_close(&fil);
#endif  /* ifdef SDCARD */

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

            image_ready = 0;
            img_cnt += 1;
            P8IFG &= 0b11111110;    // clear irq flag
            P8IE  |= 0b00000001;    // enable P8.0 interrupt
        }
    }
#endif /* ifdef DUMPIMG */
}

#ifdef REFVOLTAGE
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
#endif


void i2c_init()
{
    /* set P5.0 to SDA and P5.1 to SCL */
    P5SEL0 |= 0b00000011;
    P5SEL1 &= 0b11111100;

    /* configure eUSCI_B1 I2C */
    /* reset I2C interface */
    EUSCI_B_I2C_disable(EUSCI_B1_BASE);
    /* prepare configuration */
    EUSCI_B_I2C_initMasterParam master_config = {EUSCI_B_I2C_CLOCKSOURCE_SMCLK,       // source clock from SMCLK
                                                 CS_getSMCLK(),                       // get clock rate of SMCLK
                                                 EUSCI_B_I2C_SET_DATA_RATE_100KBPS,   // data rate 100kbps
                                                 0,                                   // tx byte counter, not used here
                                                 EUSCI_B_I2C_NO_AUTO_STOP};           // don't auto send stop
    /* write configuration */
    EUSCI_B_I2C_initMaster(EUSCI_B1_BASE, &master_config);
    /* camera address 0x24, read and write bit will be added by the hardware */
    EUSCI_B_I2C_setSlaveAddress(EUSCI_B1_BASE, HM01B0ADDR);
    return;
}


uint8_t read_camera(uint16_t regaddr)
{
    /* wait until bus is free */
    while (EUSCI_B_I2C_isBusBusy(EUSCI_B1_BASE)){;}
    /* write address to slave, switch to tx mode */
    EUSCI_B_I2C_disable(EUSCI_B1_BASE);
    EUSCI_B_I2C_setMode(EUSCI_B1_BASE, EUSCI_B_I2C_TRANSMIT_MODE);
    EUSCI_B_I2C_enable(EUSCI_B1_BASE);
    /* write address, higher byte first */
    EUSCI_B_I2C_masterSendMultiByteStart(EUSCI_B1_BASE, (uint8_t)((regaddr & 0xFF00) >> 8));
    EUSCI_B_I2C_masterSendMultiByteFinish(EUSCI_B1_BASE, (uint8_t)(regaddr & 0x00FF));
    /* wait until bus is free */
    while (EUSCI_B_I2C_isBusBusy(EUSCI_B1_BASE)){;}
    /* request data from slave, switch to rx mode */
    EUSCI_B_I2C_disable(EUSCI_B1_BASE);
    EUSCI_B_I2C_setMode(EUSCI_B1_BASE, EUSCI_B_I2C_RECEIVE_MODE);
    EUSCI_B_I2C_enable(EUSCI_B1_BASE);
    uint8_t result = EUSCI_B_I2C_masterReceiveSingleByte(EUSCI_B1_BASE);
    return result;
}

void write_camera(uint16_t regaddr, uint8_t data)
{
    /* wait until bus is free */
    while (EUSCI_B_I2C_isBusBusy(EUSCI_B1_BASE)){;}
    /* write address to slave, switch to tx mode */
    EUSCI_B_I2C_disable(EUSCI_B1_BASE);
    EUSCI_B_I2C_setMode(EUSCI_B1_BASE, EUSCI_B_I2C_TRANSMIT_MODE);
    EUSCI_B_I2C_enable(EUSCI_B1_BASE);
    /* write address, higher byte first */
    EUSCI_B_I2C_masterSendMultiByteStart(EUSCI_B1_BASE, (uint8_t)((regaddr & 0xFF00) >> 8));
    EUSCI_B_I2C_masterSendMultiByteNext(EUSCI_B1_BASE, (uint8_t)(regaddr & 0x00FF));
    EUSCI_B_I2C_masterSendMultiByteFinish(EUSCI_B1_BASE, data);
    return;
}

void write_verify_camera(uint16_t regaddr, uint8_t data)
{
    do {
        write_camera(regaddr, data);
    } while (read_camera(regaddr) != data);
    return;
}

void config_camera_lores()
{
    /* write camera i2c regs */
    write_verify_camera(0x0383, 0b00000011);   // horizontal binning timing
    write_verify_camera(0x0387, 0b00000011);   // vertical binning timing
    write_verify_camera(0x0390, 0b00000011);   // enable v and h binning

#ifndef DUMPIMG
    //__delay_cycles(4000000);            // this magic delay is critical to setting the resolution
    /* frame rate control for low resolution */
    write_verify_camera(0x0340, 0x00);
    write_verify_camera(0x0341, 0x9A);
    write_verify_camera(0x0342, 0x0E);
    write_verify_camera(0x0343, 0x44);         // 0x0342:0x0343 controls line length

#endif
    __delay_cycles(40000);
    write_camera(0x0104, 0b00000001);   // update CMU regs
}

void config_camera_hires()
{
    write_verify_camera(0x0383, 0b00000001);   // disable horizontal binning timing
    write_verify_camera(0x0387, 0b00000001);   // disable vertical binning timing
    write_verify_camera(0x0390, 0b00000000);   // disable v and h binning

#ifndef DUMPIMG
    //__delay_cycles(4000000);            // this magic delay is critical to setting the resolution
    /* frame rate control for high resolution */
    write_verify_camera(0x0340, 0x01);
    write_verify_camera(0x0341, 0x04);
    write_verify_camera(0x0342, 0x19);
    write_verify_camera(0x0343, 0x86);
#endif
    __delay_cycles(40000);
    write_camera(0x0104, 0b00000001);   // update CMU regs
}

#ifdef UARTDUMP
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
#endif  /* ifdef UARTDUMP */

#ifdef DUMPIMG

void config_dma_hires()
{
    DMA_disableInterrupt(DMA_CHANNEL_0);
    /* init channel 0 */
    DMA_initParam param0 = {DMA_CHANNEL_0,              // use channel 0
                            DMA_TRANSFER_SINGLE,         // single trigger mode
                            39772, // transfer size, dma size register is only 16bits, so we have to do 39772x4=159088 for hires
                            DMA_TRIGGERSOURCE_31,        // trigger src 31 (DMAE0 on MSP430FR)
                            DMA_SIZE_SRCBYTE_DSTBYTE,    // byte to byte transfer
                            DMA_TRIGGER_RISINGEDGE       // trigger at rising edge
    };
    DMA_init(&param0);
    return;
}

void config_dma_lores()
{
    DMA_disableInterrupt(DMA_CHANNEL_0);
    /* init channel 0 */
    DMA_initParam param0 = {DMA_CHANNEL_0,              // use channel 0
                            DMA_TRANSFER_SINGLE,         // single trigger mode
                            40016, // transfer size, equals image size
                            DMA_TRIGGERSOURCE_31,        // trigger src 31 (DMAE0 on MSP430FR)
                            DMA_SIZE_SRCBYTE_DSTBYTE,    // byte to byte transfer
                            DMA_TRIGGER_RISINGEDGE       // trigger at rising edge
    };
    DMA_init(&param0);
    return;
}

/* set interrupt handler for port 8 (FVLD) */
#pragma vector=PORT8_VECTOR
__interrupt
void PORT8_ISR()
{
    DMA_setSrcAddress(DMA_CHANNEL_0,
                      (uint32_t)(&P3IN),                // data source PORT3
                      DMA_DIRECTION_UNCHANGED);         // src addr doesn't change
    DMA_setDstAddress(DMA_CHANNEL_0,
                      (uint32_t)(img_buffer),           // data dest img_buffer
                      DMA_DIRECTION_INCREMENT);         // dest addr self increases
    DMA_enableTransfers(DMA_CHANNEL_0);

    if (image_res == 1) {
        dma_major_count = 0;
        dma_target_addr = (uint32_t)(img_buffer);
    }

    P8IFG &= 0b11111110;    // clear irq flag
    DMA_enableInterrupt(DMA_CHANNEL_0);
}

/* set interrupt handler for dma complete */
#pragma vector=DMA_VECTOR
__interrupt
void DMA_ISR()
{
    if (image_res == 1) {
        dma_major_count += 1;
        if (dma_major_count == 4) {
            image_ready = 1;    // tell main() to dump the data
            P8IE &= 0b11111110; // disable P8.0 interrupt, so we won't overwrite image buffer
            DMA_disableInterrupt(DMA_CHANNEL_0);
            DMA_clearInterrupt(DMA_CHANNEL_0);
        }
        else {
            dma_target_addr += 39772;
            DMA_setDstAddress(DMA_CHANNEL_0,
                              dma_target_addr,           // data dest img_buffer
                              DMA_DIRECTION_INCREMENT);         // dest addr self increases
            DMA_clearInterrupt(DMA_CHANNEL_0);
            DMA_enableTransfers(DMA_CHANNEL_0);
        }
    }
    else {
        image_ready = 1;
        P8IE &= 0b11111110;
        DMA_disableInterrupt(DMA_CHANNEL_0);
        DMA_clearInterrupt(DMA_CHANNEL_0);
    }
}
#endif /* ifdef DUMPIMG */

#ifdef DLKCTRL
#pragma vector=PORT4_VECTOR
__interrupt
void PORT4_ISR()
{
    P4IE  &= 0b11111100;            // disable P4.0 interrupt
#ifdef DUMPIMG
    P8IE &= 0b11111110;             // disable P8.0 interrupt, to ignore new frames
    DMA_disableInterrupt(DMA_CHANNEL_0);
#endif
#ifdef DEBUG
    P4OUT ^= 0b00001000;
#endif
    DMA_disableTransfers(DMA_CHANNEL_0);    /* discard current picture if it is not completed */
    DMA_clearInterrupt(DMA_CHANNEL_0);
    P8IFG &= 0b11111110;            // clear P8.0 irq flag
    P4IFG &= 0b11111100;            // clear irq flag
    while (1) {
        image_res = P4IN & 0b00000011;
        if (((image_res ^ (image_res >> 1)) & 0b00000001) == 0) {
            /* wait until two input pins are the same */
            image_res = image_res & 0b00000001;
            break;
        }
    }
    if (image_res == 0) {           // resolution changed to low
        /* write low resolution configs to camera and DMA engine */
        config_camera_lores();
#ifdef DUMPIMG
        config_dma_lores();
#endif
    }
    else {                          // resolution changed to high
        /* write high resolution configs to camera and DMA engine */
        config_camera_hires();
#ifdef DUMPIMG
        config_dma_hires();
#endif
    }
#ifdef DUMPIMG
    P8IFG &= 0b11111110;            // clear P8.0 irq flag
    P8IE  |= 0b00000001;             // changes commited, re-enable P8.0 irq to accept new frames
#endif
    P4IE  |= 0b00000011;            // re-enable P4.0 interrupt
#ifdef DEBUG
    P4OUT ^= 0b00001000;
#endif
}
#endif /* ifdef DLKCTRL */

