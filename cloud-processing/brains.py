#### BackCam Cloud Processing Logic ####
#
# This is the main control loop for the edge/cloud image processing of
# the BackCam platform. It takes in decoded images, de-noises them,
# and performs ML/AI tasks like face detection and recognition. From
# these results, the control loop dispatches commands to both a
# security server and the backscatter transmitter. The backscatter
# transmitter can reconfigure the camera based off commands that this
# control loop sends. For example, if a face is detected a command is
# sent to increase the camera resolution.
#
# Copyright 2019 Colleen Josephson cajoseph@stanford.edu
# Stanford University
#
import zmq
import numpy as np
from scipy import misc
import os
import time
import cv2
import face_recognition
from imutils.object_detection import non_max_suppression

font = cv2.FONT_HERSHEY_SIMPLEX
cascade_path = "face_cascades/haarcascade_frontalface_default.xml"
face_cascade = cv2.CascadeClassifier(cascade_path)
hog = cv2.HOGDescriptor()
hog.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())

# set up communication to backscatter transmitter and coffee access server 
port = 5555 # server port
host = "171.64.74.141" # backscatter transmitter IP or hostname
coffee = "172.24.74.41" # coffee machine security server


raw_img_path = "image-stream-decoding" # path for raw images
proc_img_path = "processed" # path for processed image
known_face_dir = "known_faces" # path of folder with known faces 
face_encodings = [] # encodings of known faces
face_names = []  # labels of known faces
niters = 2 # number of times to iteratively clean image

# Set up sockets to talk to servers
context = zmq.Context()
print("Connecting to iCam server...")
socket = context.socket(zmq.PAIR)
socket.setsockopt(zmq.SNDTIMEO, 1000)
csocket = context.socket(zmq.PAIR)
csocket.setsockopt(zmq.SNDTIMEO, 1000)
csocket.connect("tcp://%s:%i"%(coffee,port))
socket.connect("tcp://%s:%i"%(host,port))

# set up a directory for processed images
if not os.path.exists(proc_img_path):
    os.makedirs(proc_img_path)

def build_face_db(facedir):
    """
    loads images from the facedir and builds a db
    args: string of directory where known faces are
    """
    files = os.listdir(facedir)
    for f in files:
        img = face_recognition.load_image_file(facedir+"/"+f)
        face_encodings.append(face_recognition.face_encodings(img)[0])
        print("f",f)
        face_names.append(f[:-4])

def detect_people(frame):
	"""
	detect humans using HOG descriptor
	Args:
		frame, a cv2 matrix of a backscatter image
	Returns:
		processed frame with pededtrians boxed
	"""
	(rects, weights) = hog.detectMultiScale(frame, winStride=(8, 8), padding=(16, 16), scale=1.06)
	rects = non_max_suppression(rects, probs=None, overlapThresh=0.65)
	for (x, y, w, h) in rects:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 0, 255), 2)
            return frame

def detect_face(frame):
	"""
	detect human faces in image using face_recognition library
	Args:
		frame, a cv2 matrix of a backscatter image
	Returns:
	        tuple of (face encodings, coordinates of detected faces)
	"""
        faces = face_cascade.detectMultiScale(frame, 1.01, 5, 20)
        face_locations = face_recognition.face_locations(frame, model="cnn")
        face_encodings = face_recognition.face_encodings(frame, face_locations)
	return (face_encodings, face_locations)


def recognize_face(frame_original, faces):
	"""
	recognize human faces
	Args:
		frame_original, a cv2 matrix of a backscatter image
		faces, face encodings returned from detect_face
	Returns:
		label of predicted person
	"""
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
        return predict_label

def draw_faces(frame, faces):
    """
    draw rectangle around detected faces
    args: a frame, list of the rectangle coordinates of faces
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
    args: a frame, list of the rectangle coordinates of faces, list of the labels
    returns: processed frame
    """
    i = 0
    for (top, right, bottom, left) in faces:
        cv2.putText(frame, str(labels[i]), (left + 6, bottom - 6), font, 0.5, (255, 255, 255), 1)
        #cv2.putText(frame, str(labels[i]), (x, y), font, 0.5, (255, 255, 255), 1)
        i += 1
    return frame



'''
1 bit for resolution (0 = low, 1 = high)
3 bits for compression (how many compression modes will we have??)
3 bits for repetition code (0 = repeat 1x, 1 = repeat 2x, 3 = repeat 3x, etc)
Note: frame rate is a tradeoff between compression and repetition. 
For a desired frame rate the cloud will need to calculate the necessary 
repetition and compression level.
'''
def configure(frame, movement, face, datarate):
    """
    generate configuration string for backscatter camera
    Args:
        frame_original, a cv2 matrix of a backscatter image
        movement, bool of whether of not a threshold of pixels differed between current frame and previous
        face, number of faces detected
        datarate, (unused, stub) the current  datarate of the backscatter uplink
    Returns:
        a configuration string
    """
    config = ''

    if face > 0 and n - face <= 10:
        config += '1'
    else: config += '0'
    
    if movement:        
        config += '001'
    else: config += '000';

    config += '00'

    config += '\0' 
    return config

def remove_artifacts_and_compare(cur, prev):
    """
    generate configuration string for backscatter camera
    Args:
        frame_original, a cv2 matrix of a backscatter image
        movement, bool of whether of not a threshold of pixels differed between current frame and previous
        face, number of faces detected
        datarate, (unused, stub) the current  datarate of the backscatter uplink
    Returns:
        a configuration string
    """
    print "shape",cur.shape
    lx, ly = cur.shape
    missed = 0
    #compare against self if no prev frame yet
    if type(prev) == type(None): prev = cur
    delta = 0
    for n in xrange(niters):
        for i in xrange(lx):
            for j in xrange(ly):
                #print "pixel",cur[i,j]
                if cur[i,j] == 0:
                    missed += 1
                    if i == 0 or cur[i-1,j] == 0 and i+1 < lx:
                        cur[i, j] = cur[i+1, j]
                    elif i == lx-1 or cur[i+1,j] == 0:
                        cur[i, j] = cur[i-1, j]
                    else:
                        cur[i, j] = (cur[i-1, j].astype(int) + cur[i+1, j].astype(int))/2
                #print(abs(cur[i,j] - prev[i,j]))
                delta += np.abs(int(cur[i,j]) - int(prev[i,j]))/255.0
                
    # average delta of pixels in image
    avg_delta = delta/float((lx*ly))

    print ("avg delta",avg_delta)
    print ("missed",missed)
    #TODO; adjust threshold
    return avg_delta > 1.0

#assuming ~56 bytes per payload and 2bytes per pixel
def noise(img):
    """
    TODO
    """
    #vectorize image into segments of ~25 pixels    
    flat = img.flatten()

    #bernoilli RV for whether block is missing or not
    bitvec = np.round(np.random.rand(len(flat)/(3*41)))
    expanded = np.empty(0)

    for i in bitvec:
        expanded = np.concatenate((expanded, np.full(41*3,i)))  
    if len(expanded) < len(flat):
        expanded = np.concatenate((expanded,np.ones(len(flat)-len(expanded))))
    expanded = expanded.astype('uint8')
    return(flat*expanded).reshape(img.shape)

# the main loop
"""
TODO
"""
n = 1
face = -1
img_prev = None
movement = False
config = None
coffee_access = None
build_face_db(known_face_dir)
while True:
    
    # check images directory for new images_raw + process
    files = os.listdir(raw_img_path)
    for f in files:
        if not(f[-4:].upper() == ".PNG"): continue
        if os.path.getsize(raw_img_path+"/"+f) > 2222:
            try: 
                img = cv2.imread(raw_img_path+"/"+f)
                img_grey = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            except Exception as e:
                print "error({0}): {1}".format(e.errno, e.strerror)
                continue
        #if there's a large delta between frames, increase frame rate
        print("processing",f,  os.path.getsize(raw_img_path+"/"+f))
        #img_grey = noise(img_grey)
        movement = remove_artifacts_and_compare(img_grey, img_prev)
        img_prev = img_grey

        # detect humans/face
        img_processed = cv2.cvtColor(img_grey, cv2.COLOR_GRAY2RGB)
        #img_processed = detect_people(img_grey)
        faces, rects = detect_face(img_processed)
        print "faces in %s: %s"%(f,len(faces))
        # facial recognition
        if len(faces) > 0:
            face = n
            misc.imsave("faces" + "/" + f, img_processed) 
            label = recognize_face(img_processed, faces)
            for l in label:
                if l != "Unknown":
                    coffee_access = l;
            img_processed = draw_faces(img_processed, rects)
            img_processed = put_label_on_face(img_processed, rects, label)
            print label

        misc.imsave(proc_img_path + "/" + f, img_processed) 
        print "processed %i image(s)"%n
        # remove raw image
        os.remove(raw_img_path+"/"+f)
        n += 1 

        config = configure(n, movement, face, None)
        print ("config",config)
        movement = False

        # send message to TX server
        if config != None:
            try:
                print("Sending request...")
                socket.send(config)
            except Exception as e:
                print(e, e.errno)
                socket.close()
                socket = context.socket(zmq.PAIR)
                socket.setsockopt(zmq.SNDTIMEO, 1000)
                csocket.close()
                csocket = context.socket(zmq.PAIR)
                csocket.setsockopt(zmq.SNDTIMEO, 1000)
                csocket.connect("tcp://%s:%i"%(coffee,port))
                socket.connect("tcp://%s:%i"%(host,port))

        if coffee_access != None:
            try:
                print("Sending coffee access...")
                csocket.send("coffee "+ coffee_access)
                coffee_access = None
            except Exception as e:
                print(e, e.errno)
                socket.close()
                socket = context.socket(zmq.PAIR)
                socket.setsockopt(zmq.SNDTIMEO, 1000)
                csocket.close()
                csocket = context.socket(zmq.PAIR)
                csocket.setsockopt(zmq.SNDTIMEO, 1000)
                csocket.connect("tcp://%s:%i"%(coffee,port))
                socket.connect("tcp://%s:%i"%(host,port))
        #time.sleep(1)
