#import OpenCV module
import cv2
#import os module for reading training data directories and paths
import os
#import numpy to convert python lists to numpy arrays as 
#it is needed by OpenCV face recognizers
import numpy as np
import json
proc_img_path = "processed" # path for processed image
#import face_recognition


#assuming ~56 bytes per payload and 2bytes per pixel
def noise(img, thresh = 0.5):
    #vectorize image into segments of ~25 pixels    
    flat = img.flatten()

    #bernoilli RV for whether block is missing or not
    bitvec = (np.random.rand(int(len(flat)/(3*41))) >= thresh).astype('float')
    expanded = np.empty(0)

    for i in bitvec:
        expanded = np.concatenate((expanded, np.full(41*3,i)))  
    if len(expanded) < len(flat):
        expanded = np.concatenate((expanded,np.ones(len(flat)-len(expanded))))
    expanded = expanded.astype('uint8')
    return(flat*expanded).reshape(img.shape)


def remove_artifacts(cur):
    lx, ly = cur.shape
    #compare against self if no prev frame yet
    #if type(prev) == type(None): prev = cur
    for i in range(lx):
        for j in range(ly):
                #print "pixel",cur[i,j]
            if cur[i,j] == 0:
                if i == 0 or cur[i-1,j] == 0 and i+1 < lx:
                    cur[i, j] = cur[i+1, j]
                elif i == lx-1 or cur[i+1,j] == 0:
                    cur[i, j] = cur[i-1, j]
                else:
                    cur[i, j] = (cur[i-1, j].astype(int) + cur[i+1, j].astype(int))/2
                #print(abs(cur[i,j] - prev[i,j]))

psnrs={.05:[],.10:[],.15:[],.20:[],.25:[],.30:[],.35:[],.40:[]}
def prepare_data(data_folder_path):
    #------STEP-1--------
    #get the directories (one directory for each subject) in data folder
    dirs = os.listdir(data_folder_path)
    
    #let's go through each directory and read images within it
    for dir_name in dirs:
        
        #our subject directories start with letter 's' so
        #ignore any non-relevant directories if any
        if not dir_name.startswith("s"):
            continue;
              
        #build path of directory containin images for current subject subject
        #sample subject_dir_path = "training-data/s1"
        subject_dir_path = data_folder_path + "/" + dir_name
        
        #get the images names that are inside the given subject directory
        subject_images_names = os.listdir(subject_dir_path)
        
        #------STEP-3--------
        #go through each image name, read image, 
        #detect face and add face to list of faces
        count = 0
        for image_name in subject_images_names:
            print(count)
            count +=1
            for t in [.05,.10,.15,.20,.25,.30,.35,.40]:
                #ignore system files like .DS_Store
                if not image_name.endswith("png"):
                    continue;
            
                image_path = subject_dir_path + "/" + image_name

                image =  cv2.cvtColor(cv2.imread(image_path), cv2.COLOR_BGR2GRAY)

                nimage = noise(image, thresh = t)
                psnr_noise = cv2.PSNR(image, nimage)
            
                #cv2.imshow(str(psnr_noise), np.hstack((image,nimage)))
                #cv2.waitKey(0)
                remove_artifacts(nimage)
                psnr_cleaned = cv2.PSNR(image, nimage)
                #cv2.imshow(str(psnr_cleaned), np.hstack((image,nimage)))
                #cv2.waitKey(0)
                #print((psnr_noise, psnr_cleaned))
                psnrs[t].append((psnr_noise, psnr_cleaned))
                        

print("Preparing data...")
f = prepare_data("training-data")
print("Data prepared")

print(psnrs)
with open("output", "w+") as o:
    json.dump(psnrs,o)
