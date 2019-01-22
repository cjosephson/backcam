sudo rfkill unblock wifi; sudo rfkill unblock all

#Set to  channel 3 and channel width 20Mhz
CH=3
WIDTH="HT20"
sudo ./setup_inject.sh $CH $WIDTH


#RATE_DESC= "6Mbps OFDM"
#RATE = "0x0400D" 

RATE_DESC="1Mbps legacy"
RATE="0x420A" 

#echo 0x4901 | sudo tee `find /sys -name monitor_tx_rate`
echo $RATE | sudo tee `find /sys -name monitor_tx_rate`

echo "Ready to transmit on Ch $CH $WIDTH at $RATE_DESC"
sudo ./inject
