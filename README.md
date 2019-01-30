camera-fpga: fpga code for the BackCam board, responsible for downlink
	     and backscatter uplink

camera-mcu: MCU driver code for the camera, configures and controls
	    the camera

cloud-processing: legacy python decoder, plus image processing
		  pipeline code (noise removal, face recognition)

compression: python simulation code for compression algorithm eval
	     

decoder: realtime auto-size-adjusting backscatter decoder written in C

demo-setup: some older code demonstrating image capture and receive,
	    useful for debugging

hardware: project files for hardware board design

transmitter: backscatter excitation/downlink transmitter code


NOTE: a 7zipped linux image for the transmitter is at http://web.stanford.edu/~cajoseph/bs-injection.img.7z with MD5 = 88afae37871665a57a705b29aa4d6ca1

# Getting started

Once the boards in the hardware directory have been fabricated and assembled, you need four more pieces of equipment:

1. A [wifi card](https://null-byte.wonderhowto.com/how-to/buy-best-wireless-network-adapter-for-wi-fi-hacking-2018-0178550/) 
capable of packet injection (we used a TP-LINK TL-WN722N) on a Linux disribution (we used Kali, our image is above)
2. A wifi chipset that allows you to capture packets in monitor mode, and does not discard packets with bad CRC checksums. We used a 2015 MacBook Pro. NOTE: newer MacBooks (the kind with the fancy keyboard) do not have a compatable wifi card.
3. A FlashPro 5 FPGA programmer 
4. A MSP-FETFlash MCU debugger/programmer 
5. two 2.5Ghz antennas, such as VERT2450

## Power

Power the BackCam platform using a 3.3V power source on any VCC and GND pin.

## Programming the FPGA

Download the backscatter program into the FPGA on the radio board. You need to be a bit careful when you connect the 
FlashPro 5 programmer with the FPGA programming header. Make sure that your connection is correct 
(tringle on the cable connector should align with p1, which has a square solder pad). Wrong connection could damage the FPGA.

## Programming the MCU

Download [TI CCS] (http://processors.wiki.ti.com/index.php/Download_CCS#Download_the_latest_CCS). Select 'MSP430 ultra-low power + performance MCU' in the processor support section

- Run CCS. Go to View -> Resource Explorer. Select and install Software->MSP430Ware.
- Add the driverlib via Window->Preferences->Code Composer Studio->Products. Use the add button to select the driverlib.
   Depending on your OS, it could be in /Users/<username>/ti/msp/MSP430Ware_x_xx_xx_xx/driverlib, 
   /Users/<username>/ti/msp430ware_x_xx_xx_xx/driverlib,  /home/<your_username>/ti/msp/MSP430Ware_x_xx_xx_xx/driverlib, 
   C:/ti/msp/MSP430Ware_x_xx_xx_xx/driverlib, or something different.  
-- press "rediscover"
- Add the camera-mcu project via File->Open Projects From File System. Click 'Directory...' on the top right side of the popup dialog and add the camera-mcu directory.
- Click the hammer on the top left and make sure the project builds
- Connect the TI programming header to the camera board. The triangle on the cable connector should be aligned with the pin that has a little 1 printed next to it. It also has a square solder pad.
- Click the bug button to enter debug mode and program the FPGA. Once you have pressed the play button in debug mode, the MCU is programmed. You can press the stop button and the main loop will keep running. The program is nonvolatile, so it will be run every time the MCU boots until it is reprogrammed. 

## Focus the camera

In the MCU code main.c, comment out #define TESTPATTERN. Program the MCU, and then run the serial receiver is in cloud-processing/image-stream-decoding/serial_stream.c (compile instructions in README within directory). The first 10 images will probably be white while the camera's automatic gain setting adjusts. If the images are white for longer than 20 images, you may need to move to a room with dimmer light. NOTE: it is possible to turn off the camera's automatic gain and set it by hand, see the camera data sheet. 

The images will be blurry at first, twist the lens to bring them into focus. We recommend focusing using the smaller images, as the feedback loop is shorter. 

## Set up packet injection

See the instructions in the transmitter directory. Verify that packets are being injected on Ch. 3 (hint: filter by the MAC address specified in line 44 of backscatter-tx.c). The captured packets should have blank payloads. 

## Reprogram the MCU for wireless mode

In the MCU code main.c, make sure #define TESTPATTERN and #define UARTDUMP are commented out.
Use line 163 to set the reference voltage. `uint16_t` maxes at 65535, so to convert a volatage to a DAC value use this formula: `(volts/3.3)*65535`. Our code defaults to 24500, which is ~1.2V. 

Program the MCU and then capture packets on Ch. 13. Most of the packets should have non-blank payloads (a few blank payloads is normal). A blank payload means the backscatter radio is failing to inject data. Usually adjusting the reference voltage will fix this. 

## Put it all together

Connect two 2.4GHz antennas. Turn on the WiFi injection code. Compile the decoder according to the instructions in the decode directory, and then demo.sh and check that images are being received. They may be noisy. If they are completely black, try decreasing the reference voltage. Once that is successful, 
modify the raw_img_path variable in brains.py to where the images are being dumped, and then execute brains.py. It will process each image as the decoder dumps it, and the cleaned images will be output to the directory specified by proc_img_path
