Compile: ` gcc backscatter-tx.c -lpcap -lczmq -lzmq -o inject`

Transmit: `sudo ./transmit.sh`

### RPi Hardware and Software Setup

Install Kali Linux on the Raspberry Pi. Configure the Ethernet interface to use a static IP address, so it'd be easier to find the RPi when connecting it directly to your Mac.

Connect Port D4, D5 on radio board to Port D0, D1 on MCU board. This passes downlink resolution control to the camera.

Config details for our own Pie:

- IP Address: 192.168.0.38
- SSH Server: Port 22
- Username: root
- Password: toor
- TP-Link Interface: wlan1, wlan1mon (monitor mode)
- The on-board WiFi interface has been disabled to prevent interference

### Connect RPi to the Internet

1. install squid on your mac (`brew install squid`). The default config works well.
2. exec `squid` (there may be firewall prompts)
3. on RPi, exec `export https_proxy=http://<YOUR_MAC_LAN_IP>:3128` and `export http_proxy=http://<YOUR_MAC_LAN_IP>:3128`
4. the current shell session is now configured to use the proxy on your mac (do this every time when starting a new shell session, or just put it in shell rc file)

### Install Deps

Install the following deps:

    - libzmq3-dev
    - libczmq-dev
    - libpcap-dev

### Compile the code

To compile, exec `gcc backscatter-tx.c -lpcap -lczmq -lzmq -o inject`

### Run the injection

1. Set up the interface. On Intel NUC, use `setup_inject.sh`. On RPi, use `setup.sh`. You may need to modify `backscatter-tx.c` to use the correct monitor interface.
2. exec `inject`

### Test

By default, the `inject` program will transmit excitation packets. It also opens a zmq port and basically transmits all data received on that port. To test this function and send downlink message, install additional deps:

- python3-dev
- python3-pip
- pkg-config
- zmq (_install via pip3_)

When `inject` is running, start the test script by executing `python3 downlink-test.py`.
