import cv2
import os
import numpy as np
import json

superpix = np.ndarray((244*326,3))
key = None
count = 0
raw_img_path = "hour"#"finals_week"
files = os.listdir(raw_img_path)
files.sort()
psnrs = []
compression = []

for f in files:
    if not(f[-4:].upper() == ".PNG"): continue

    if os.path.getsize(raw_img_path+"/"+f) > 2222:
        img = cv2.imread(raw_img_path+"/"+f)
        img = img.reshape(-1,img.shape[-1])
        if count == 0:
            #Read in an image and calculate superpixels (1x4 region?) and save this
            key = img.reshape(-1,img.shape[-1])
            for p in range(0,len(key), 4): 
                superpix[int(p/4.)]=np.sum(key[p:p+4],axis=0)/4.0 
            compression.append(0)
            psnrs.append(0)
        #Read in another image and calculate superpixels. Send -1 if unchanged?
        else:
            imbuf = []
            #If changed enough, send the whole super-pixel
            for p in range(0,len(img), 4): 
                sp=np.sum(img[p:p+4],axis=0)/4.0 
                if np.linalg.norm(superpix[int(p/4)]-sp) > 10:
                    imbuf.append(img[p:p+4])
                else: imbuf.append(-1)
            #reconstruct image
            #print(len(imbuf), imbuf)
            recon = np.zeros((244,326,3),dtype='uint8')
            recon = recon.reshape(-1,recon.shape[-1])
            pcount = 0
            for i,p in enumerate(imbuf):
                if type(p) == type(-1):
                    recon[i*4:(i+1)*4] = key[i*4:(i+1)*4]
                else:
                    pcount += 1
                    recon[i*4:(i+1)*4] = p
            compression.append(pcount)
            recon = recon.reshape((244,326,3))
            #calculate psnr
            psnr = cv2.PSNR(img.reshape((244,326,3)), recon)
            cv2.imshow(f+str(psnr),np.hstack((img.reshape((244,326,3)), recon)))
            cv2.waitKey(0)
            psnrs.append(psnr)
            with open("output","w+") as o:
                json.dump(psnrs, o)
                json.dump(compression, o)
        count = (count +  1)%80 #Replace the entire frame every 80?
        print(f)
print("psnrs",psnrs)
print("pixel count",compression)

        
