#bin/bash

sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=3
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I en0

sudo tcpdump -G 30 -W 1 -I -P -i en0 -w './dump.pcap'
