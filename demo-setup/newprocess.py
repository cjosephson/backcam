from decode import *
import fileinput
import subprocess

# image_size = 3032
# image_size = 10004
image_size = 20008

convcomm = 'ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 164x122 -i IMG_{0} -f image2 -vcodec png IMG_{0}.png &> /dev/null'

error = 0
unique = 0
ambiguous = 0

firstimg = True

datastream = []
base = 0
imagecount = 0

# check data integrity by verifying the second last byte
verify = lambda pac: (pac[-2] == 146)

# apply decode function to each line
i = 0;
for line in fileinput.input():
    i += 1
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

        # ISSUE what is entire packet is 10010010's?
        pac.pop(-1) # the last byte maybe corrupted
        while (len(pac) > 10 and pac[-1] == 146):
            del pac[-1]
        if len(pac) < 10: continue #packet too short, terminate
        seq = pac[-2] + pac[-3] * 256
        sz = pac[-1]
        '''
        seq = pac[-5] + pac[-6] * 256
        sz = pac[-4]
        '''
        if pac[0] == 170 and pac[1] == 170 and pac[2] == 170:
            print("Detected frame head")
            if (firstimg):
                firstimg = False
            else:
                # if this is the header of an image
                with open("IMG_" + str(imagecount), 'wb') as dp:
                    wtbuf = bytes(datastream[:image_size])
                    dp.write(wtbuf)
                if (image_size == 20008):
                    subprocess.Popen(convcomm.format(imagecount), shell=True)
                print("Image # dumped", imagecount, ", size=", len(wtbuf))
            datastream = [0] * image_size
            base = seq
            imagecount += 1
        else:
            if seq <= base:
                seq += 65536
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
