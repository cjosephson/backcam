# Dependencies
python (both 2.7 and 3 should work)
opencv3 (brew install opencv)
If you get a message like this, do what it says:
please run:
  mkdir -p /Users/cjoseph/.local/lib/python2.7/site-packages
  echo 'import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")' >> /Users/cjoseph/.local/lib/python2.7/site-packages/homebrew.pth
opencv-python, imutils (pip install opencv-python imutils)
zmq (brew install zmq)
pyzmq (brew install pyzmq)
anaconda (https://www.anaconda.com/download/)
cvxpy (conda install -c cvxgrp cvxpy libgcc)
tshark (brew install tshark)
ffmpeg (brew install ffmpeg)

you may need to do ‘pip install numpy --upgrade’, or research a number of other issues. Python on OSX is not very well organized and I had lots of new things to debug each time I installed this. 

# To receive images
1.) start the receiver ../decoder/decode to dump images into the image-stream-decoding directory
2.) start the processing loop, 'python brains.py'
3.) processed images will appear in the processed directory

# Directory map

### archive
old versions of code, abandoned libraries, data crunching code

### brains.py
the control loop that processes images and then dispatches control signals to the BackCam board

### face_cascades
haar cascade xml files for face detection

### FaceDetect
a face detection library from https://realpython.com/blog/python/face-recognition-with-python/

### image-stream-decoding
contains a serial receiver for camera images, which dumps images in the default raw_img_path for brains.py. Great for debugging. 

### known_faces
high-resolution images of known faces act as the face database for the face recognition library

### PersonDetect
a person (body) detection library from https://github.com/ITCoders/Human-detection-and-Tracking/

### test-data
images of some faces to test the face_recognition library. They can be then put in image-stream-decoding and then noised with the noise function in brains.py to simulate the backscatter RX pipeline