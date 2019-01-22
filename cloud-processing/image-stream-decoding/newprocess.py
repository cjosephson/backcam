from decode import *
import fileinput
import subprocess
import time

# image_size = 3032
# image_size = 10004
image_size = 20008
# image_size = 79544


convdelt = '/Users/yangl1996/Downloads/backscatter/image-stream-decoding/deltamodulation IMG_{0} && mv /Users/yangl1996/Downloads/backscatter/image-stream-decoding/output.png /Users/yangl1996/Downloads/backscatter/image-stream-decoding/IMG_{0}.png && rm /Users/yangl1996/Downloads/backscatter/image-stream-decoding/output.*'
convdown = '/Users/yangl1996/Downloads/backscatter/image-stream-decoding/downsampling IMG_{0} && mv /Users/yangl1996/Downloads/backscatter/image-stream-decoding/output.png /Users/yangl1996/Downloads/backscatter/image-stream-decoding/IMG_{0}.png && rm /Users/yangl1996/Downloads/backscatter/image-stream-decoding/output.*'
convcomm = 'ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 164x122 -i IMG_{0} -f image2 -vcodec png IMG_{0}.png &> /dev/null'
hirescomm = 'ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 326x244 -i IMG_{0} -f image2 -vcodec png IMG_{0}.png &> /dev/null'

error = 0
unique = 0
ambiguous = 0

firstimg = True

datastream = []
base = 0
imagecount = 0
prev = None
data = 0 #EWMA
rate = 0.75 #ewma rate

def update(bytes, time):
    global data 
    data = rate*data + (1-rate)*bytes/time
    #print("data",data,"elapsed",elapsed)

# check data integrity by verifying the second last byte
verify = lambda pac: (pac[-2] == 146)

# apply decode function to each line
start = time.time();
for line in fileinput.input():

    if line == '\n':
        continue
    try:
        line = allign(line)
        # filter candidate based on last two bytes (==146)
        filtered = list(filter(verify, map(list, line)))
    except:
        filtered = []
    if len(filtered) == 0:
        error += 1
    elif len(filtered) == 1:
        # if exactly one candidate remains
        unique += 1
        pac = filtered[0]
        # TODO: what if the packet shifted right a byte? we need to 
        # smartly determine where are the seq and sz
        # we should put sz to pac[-5], since sz can't go larger than 146,
        # we can just search for the last 146 in the packet to determine
        # the bonudary
        pac.pop(-1) # the last byte maybe corrupted
        while (len(pac) > 10 and pac[-1] == 146):
            del pac[-1]
        if len(pac) < 10: continue #packet too short, terminate
        
        '''
        the sequence number stands for the number of bytes transmitted
        so far. For example, packet 1 seq=2768685, packet 2
        seq=2768737, so packet 2 has 52 bytes of payload

        the seq number uses a 24-bit register, so it resets at 16,777,215
        
        Unfortunately this system makes it hard to tell when a packet
        has been missed. The payload size changes depending on the
        backscatter packet length. For a 200-byte payload in 802.11b
        operating at 1Mbps, there's 52ish bytes of backscatter
        payload. This is because each byte is repeated at least 3x for
        the majority voting.
        '''
        if prev == None:
            seq = pac[-2] + pac[-3] * 256 + pac[-4] * 256 * 256
            prev = seq
        else:
            prev = seq
            seq = pac[-2] + pac[-3] * 256 + pac[-4] * 256 * 256
            if seq-prev > 0:
                elapsed = time.time() - start;
                start = time.time();
                update(52, elapsed)

        sz = pac[-1]
        # detect frame head
        if pac[0] == 170 and pac[1] == 170 and pac[2] == 170:
            if (firstimg): #discard first image because it isn't whole
                firstimg = False
            else: # if this is not the first header
                with open("IMG_" + str(imagecount), 'wb') as dp:
                    wtbuf = bytes(datastream[:image_size])
                    dp.write(wtbuf)
                if (image_size == 20008):
                    subprocess.Popen(convcomm.format(imagecount), shell=True)
                elif (image_size == 10004):
                    subprocess.Popen(convdown.format(imagecount), shell=True)
                elif (image_size == 3032):
                    subprocess.Popen(convdelt.format(imagecount), shell=True)
                elif (image_size == 79544):
                    subprocess.Popen(hirescomm.format(imagecount), shell=True)
                print("Image # dumped", imagecount, ", size=", len(wtbuf), 
                      ", datarate %.2f"%(data*8/1024),"kbps")
            # reset buffer
            datastream = [0] * image_size
            base = seq
            imagecount += 1
        else:
            if seq <= base:
                seq += 16777216
            offset = seq - base
            # the following two lines are to avoid corrupted size byte
            # we have to make sure the sz is no larger than pac[]
            pac = pac[:sz]
            sz = len(pac)
            # the following line is to make sure offset does not overrun
            if (offset <= image_size) and (offset > 0):
                datastream[offset - sz:offset] = pac[:sz]
            else:
                if not firstimg:
                    error += 1
    else:
        ambiguous += 1


print("Error:     ", error)
print("Unique:    ", unique)
print("Ambiguous: ", ambiguous)

