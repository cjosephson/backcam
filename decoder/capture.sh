#bin/bash

sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=13
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I en0



# -I for monitor mode, -P for pcap-ng -U for packet-buffered output -i to set interface
rm IMG*
#tshark -I -T fields -a duration:22 -e data -i en0 | python3 newprocess.py
tshark -I -f 'wlan host 01:23:45:67:89:AB' -i en0 -a duration:20 -w capture.pcap
