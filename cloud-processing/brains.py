#
#   Hello World client in Python
#   Connects REQ socket to tcp://localhost:5555
#   Sends "Hello" to server, expects "World" back
#
import zmq
import numpy as np
import cvxpy as cvx
from scipy import ndimage
import matplotlib.pyplot as plt
from scipy import misc
import os
import time
import cv2
import glob
import imutils
import face_recognition
from imutils.object_detection import non_max_suppression

subject_label = 1
font = cv2.FONT_HERSHEY_SIMPLEX
list_of_videos = []
cascade_path = "face_cascades/haarcascade_frontalface_default.xml"
face_cascade = cv2.CascadeClassifier(cascade_path)
hog = cv2.HOGDescriptor()
hog.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())
recognizer = cv2.face.LBPHFaceRecognizer_create()
#load pretrained recognizer
recognizer.read("LBPHtrained.yml")
# set threshold of confidence for face matching. For LBPH, the lower
# the better the metric for confidence is some (unknown to me)
# distance metric. This is poorly documented in CV2 docs
recognizer.setThreshold(122)
count=0

port = 5555 # server port
host = "171.64.74.141" # server hostname or ip
coffee = "172.24.74.41"
raw_img_path = "image-stream-decoding" # path for raw images
proc_img_path = "processed" # path for processed image
niters = 2 # number of times to iteratively clean image
labels = ["Colleen", "", ""]

# Socket to talk to TX server
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


face_encodings = []
face_names = []
def build_face_db(facedir):
    files = os.listdir(facedir)
    for f in files:
        img = face_recognition.load_image_file(facedir+"/"+f)
        face_encodings.append(face_recognition.face_encodings(img)[0])
        print("f",f)
        face_names.append(f[:-4])

#remove color artifacts by looking at delta across RGB
#values. If delta across RGB values for a given pixel is >40,
#reassign the value via interpolation
def color(p):
    return max(np.abs(p[0].astype(int)- p[1].astype(int)),
               np.abs(p[0].astype(int)-p[2].astype(int))) > 40
    #TODO: fix color artifact removal...very bad performance for IMG_0.png!
    return False

def detect_people(frame):
	"""
	detect humans using HOG descriptor
	Args:
		frame:
	Returns:
		processed frame
	"""
	(rects, weights) = hog.detectMultiScale(frame, winStride=(8, 8), padding=(16, 16), scale=1.06)
	rects = non_max_suppression(rects, probs=None, overlapThresh=0.65)
	for (x, y, w, h) in rects:
		cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 0, 255), 2)
	return frame

def detect_face(frame):
	"""
	detect human faces in image using haar-cascade
	Args:
		frame:
	Returns:
	coordinates of detected faces
	"""
        # detectMultiScale(frame, scaleFactor, minNeighbors, minSize, maxSize)
        # https://stackoverflow.com/questions/20801015/recommended-values-for-opencv-detectmulti
        
        #this yields a better face detection rate, but does not match training
	#faces = face_cascade.detectMultiScale(frame, 1.01, 5, 20)

        #this matches training. If I try to train with the values
        #above, too many "fake faces" are detected from the 326 width images
        faces = face_cascade.detectMultiScale(frame, 1.01, 5, 20)
        print("faces",len(faces))
        face_locations = face_recognition.face_locations(frame, model="cnn")
        print("faces2",len(face_locations))
        face_encodings = face_recognition.face_encodings(frame, face_locations)
	return (face_encodings, face_locations)


def recognize_face(frame_original, faces):
	"""
	recognize human faces using LBPH features
	Args:
		frame_original:
		faces:
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
    config = ''
    # TODO: run optimization alg
    constraints = []
    x = np.matrix('1 1 1 1').T
    S = cvx.Semidef(4)
    prob = cvx.Problem(cvx.Maximize(x.T*S*x), constraints)
    #print prob.solve()
    #print S.value

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
n = 1
face = -1
img_prev = None
movement = False
config = None
coffee_access = None
build_face_db("known_faces")
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
        faces,rects = detect_face(img_processed)
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
        

