import numpy as np
from PIL import Image
import time 
import os

i = 0
while True:
    imarray = np.random.rand(120,160,3) * 255
    im = Image.fromarray(imarray.astype('uint8')).convert('RGBA')
    im.save('IMG_%i.png' % i, "PNG")
    # hopefully prevents IOErrors due to brain.py opening partially written images
    os.rename('IMG_%i.png' % i,'../images/IMG_%i.png' % i)
    
    print("generated IMG_%i.png" % i)
    i += 1
    time.sleep(2)
