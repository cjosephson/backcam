
# coding: utf-8

# Face Recognition with OpenCV

# To detect faces, I will use the code from my previous article on [face detection](https://www.superdatascience.com/opencv-face-detection/). So if you have not read it, I encourage you to do so to understand how face detection works and its Python coding. 

# ### Import Required Modules

# Before starting the actual coding we need to import the required modules for coding. So let's import them first. 
# 
# - **cv2:** is _OpenCV_ module for Python which we will use for face detection and face recognition.
# - **os:** We will use this Python module to read our training directories and file names.
# - **numpy:** We will use this module to convert Python lists to numpy arrays as OpenCV face recognizers accept numpy arrays.

# In[1]:

#import OpenCV module
import cv2
#import os module for reading training data directories and paths
import os
#import numpy to convert python lists to numpy arrays as 
#it is needed by OpenCV face recognizers
import numpy as np
from scipy import misc
proc_img_path = "processed" # path for processed image
import face_recognition
# ### Training Data

# The more images used in training the better. Normally a lot of images are used for training a face recognizer so that it can learn different looks of the same person, for example with glasses, without glasses, laughing, sad, happy, crying, with beard, without beard etc. To keep our tutorial simple we are going to use only 12 images for each person. 
# 
# So our training data consists of total 2 persons with 12 images of each person. All training data is inside _`training-data`_ folder. _`training-data`_ folder contains one folder for each person and **each folder is named with format `sLabel (e.g. s1, s2)` where label is actually the integer label assigned to that person**. For example folder named s1 means that this folder contains images for person 1. The directory structure tree for training data is as follows:
# 
# ```
# training-data
# |-------------- s1
# |               |-- 1.jpg
# |               |-- ...
# |               |-- 12.jpg
# |-------------- s2
# |               |-- 1.jpg
# |               |-- ...
# |               |-- 12.jpg
# ```
# 
# The _`test-data`_ folder contains images that we will use to test our face recognizer after it has been successfully trained.

# As OpenCV face recognizer accepts labels as integers so we need to define a mapping between integer labels and persons actual names so below I am defining a mapping of persons integer labels and their respective names. 
# 
# **Note:** As we have not assigned `label 0` to any person so **the mapping for label 0 is empty**. 

# In[2]:

#there is no label 0 in our training data so subject name for index/label 0 is empty
faces_small = []
faces_large = []

#given width and heigh
def draw_rectangle(img, rect):
    (x, y, w, h) = rect
    cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)
    
#function to draw text on give image starting from
#passed (x, y) coordinates. 
def draw_text(img, text, x, y):
    cv2.putText(img, text, (x, y), cv2.FONT_HERSHEY_PLAIN, 0.9, (0, 255, 0), 1)


face_encodings = []
face_names = []
face_cascade = cv2.CascadeClassifier("face_cascades/haarcascade_frontalface_default.xml")
def build_face_db(facedir):
    files = os.listdir(facedir)
    for f in files:
        img = face_recognition.load_image_file(facedir+"/"+f)
        face_encodings.append(face_recognition.face_encodings(img)[0])
        print("f",f)
        face_names.append(f[:-4])

def draw_faces(frame, faces):
    """
    draw rectangle around detected faces
    Returns: face drawn processed frame
    """
    print("faces",faces)
    for (top, right, bottom, left) in faces:
        cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)
        #cv2.rectangle(frame, (xA, yA), (xB, yB), (0, 255, 0), 2)
    return frame


def put_label_on_face(frame, faces, labels):
    """
    draw label on faces
    returns processed frame
    """
    i = 0
    for (top, right, bottom, left) in faces:
        cv2.putText(frame, str(labels[i]), (left + 6, bottom - 6), cv2.FONT_HERSHEY_PLAIN,
                    0.5, (255, 255, 255), 1)
        #cv2.putText(frame, str(labels[i]), (x, y), font, 0.5, (255, 255, 255), 1)
        i += 1
    return frame

def recognize_face(frame_original):
        face_locations = face_recognition.face_locations(frame_original, model="cnn")
        faces = face_recognition.face_encodings(frame_original, face_locations)
	predict_label = []
	predict_conf = []
        for f in faces:
            matches = face_recognition.compare_faces(face_encodings, f)
            name = "Unknown"

            # If a match was found in known_face_encodings, just use the first one.
            if True in matches:
                first_match_index = matches.index(True)
                name = face_names[first_match_index]
            predict_label.append(name)
        frame_original = draw_faces(frame_original, face_locations)
        frame_original = put_label_on_face(frame_original, face_locations, predict_label)
        return face_locations,predict_label
        

def detect_face(frame, size):
    # detectMultiScale(frame, scaleFactor, minNeighbors, minSize, maxSize)
    # https://stackoverflow.com/questions/20801015/recommended-values-for-opencv-detectmulti
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    #this yields a better face detection rate, but does not match training
    if size=="small":
        faces = face_cascade.detectMultiScale(gray, 1.01, 5, 20)
    else:
        #w/ settings above, too many "fake faces" are detected from the 326 width images
        faces = face_cascade.detectMultiScale(gray, 1.1, 5, 20)
    cnn_faces,labels = recognize_face(frame)
    for f in faces:
        draw_rectangle(frame, f)

    return (max(len(faces),len(cnn_faces)), labels)

def prepare_training_data(data_folder_path):
    build_face_db("known_faces")
    #------STEP-1--------
    #get the directories (one directory for each subject) in data folder
    dirs = os.listdir(data_folder_path)
    
    #list to hold all subject faces
    nfaces = 0
    
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
        for image_name in subject_images_names:
            
            #ignore system files like .DS_Store
            if not image_name.endswith("png"):
                continue;
            
            #build image path
            #sample image path = training-data/s1/1.pgm
            image_path = subject_dir_path + "/" + image_name

            #read image
            image = cv2.imread(image_path)
                        
            #detect face
            #display an image window to show the image 
            cv2.imshow("Training on image...", cv2.resize(image, (400, 500)))
            if image_name.startswith('s') or image_name.startswith('hs'):
                faces,labels = detect_face(image,"small")
                nfaces += faces
                faces_small.append(labels)
                if faces > 0:
                    cv2.imwrite(subject_dir_path+"/faces_small/"+image_name, image)
            else:
                faces,labels = detect_face(image,"large")
                faces_large.append(labels)
                nfaces += faces
                if faces > 0:
                    cv2.imwrite(subject_dir_path+"/faces_large/"+image_name, image)
            cv2.waitKey(1)

            
    cv2.destroyAllWindows()
    cv2.waitKey(1)
    cv2.destroyAllWindows()
    
    return nfaces

print("Preparing data...")
f = prepare_training_data("training-data")
print("Data prepared")

#print total faces and labels
print("Total faces: ", f)
print("faces_small",faces_small)
print("faces_large",faces_large)
