import numpy as np
from scipy import ndimage
import matplotlib.pyplot as plt
from scipy import misc
import os
import time
import cv2
import glob
import imutils



proc_img_path="processed"
raw_img_path="test-data"
# check images directory for new images_raw + process
files = os.listdir(raw_img_path)
for f in files:
    if not(f[-4:].upper() == ".PNG"): continue
    if os.path.getsize(raw_img_path+"/"+f) > 2222:
        try: 
            # numpy.ndarray
            img = cv2.imread(raw_img_path+"/"+f)
            noised = noise(img)
            misc.imsave(proc_img_path + "/" + f, noised) 

        except IOError as e:
            print "I/O error({0}): {1}".format(e.errno, e.strerror)
    
    
            

    
