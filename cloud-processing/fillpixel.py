from scipy import ndimage
import numpy as np
import matplotlib.pyplot as plt
from scipy import misc
import os
import argparse

parser = argparse.ArgumentParser(description='Remove artifacts from backscatter cam images.')
parser.add_argument('-p','--path', dest='path',  default='.',
                   help='path to images (default: current directory)')

args = parser.parse_args()
print("removing artifacts in '"+args.path+"'")

#remove color artifacts by looking at delta across RGB
#values. If delta across RGB values for a given pixel is >40,
#reassign the value via interpolation
def color(p):
    return max(np.abs(p[0].astype(int)- p[1].astype(int)),
               np.abs(p[0].astype(int)-p[2].astype(int))) > 40
    #TODO: fix color artifact removal...very bad performance for IMG_0.png!
    return False

def remove_artifacts(f):
    #print "shape",f.shape
    lx, ly = f.shape
    for n in xrange(niters):
        for i in xrange(lx):
            for j in xrange(ly):
                #print "pixel",f[i,j]
                if f[i,j] == 0:
                    if i == 0 or f[i-1,j] == 0 and i+1 < lx:
                        f[i, j] = f[i+1, j]
                    elif i == lx-1 or f[i+1,j] == 0:
                        f[i, j] = f[i-1, j]
                    else:
                        f[i, j] = (f[i-1, j].astype(int) + f[i+1, j].astype(int))/2

files = os.listdir(args.path)
niters = 2
n = 1
if not os.path.exists(args.path+"/processed"):
    os.makedirs(args.path+"/processed")
for f in files:
    if not(f[-4:].upper() == ".PNG"): continue
    i = misc.imread(f)
    #print i
    remove_artifacts(i)
    #plt.figure()                
    #plt.imshow(f)
    # plt.figure()
    # orig = misc.imread(name)
    # plt.imshow(orig[100:106,0:6])
    # print f[103,4]
    # print orig[102:105,4]
    # plt.figure()                
    # plt.imshow(i)
    # plt.figure()
    # plt.imshow(misc.imread(f))
    # plt.show()
    misc.imsave(args.path+"/processed/"+f[:-4]+"_processed"+f[-4:], i) 
    print "processed %i image(s)"%n
    n+=1
print("Done")
