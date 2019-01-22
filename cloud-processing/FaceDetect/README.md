Install opencv3, make sure GTK or QT is enabled
Install opencv python bindings: 'pip install opencv-python'

Run the code like this:

*python face_detect_cv3.py abba.png*

If this fails with "File "face_detect_cv3.py", line 30, in <module>
    cv2.imshow("Faces found", image)
cv2.error: /io/opencv/modules/highgui/src/window.cpp:605: error: (-2) The function is not implemented. ", run as root,


If you want to understand how the code works, the details are here:
https://realpython.com/blog/python/face-recognition-with-python/
