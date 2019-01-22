rm IMG*
cp $1 dump.pcap
bash convert.sh
cat dump.txt | ./decode
rm dump.txt
rm dump.pcap
