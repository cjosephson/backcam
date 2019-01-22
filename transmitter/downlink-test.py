import zmq
import time

port = 5555
host = "127.0.0.1"    # transmitter address
context = zmq.Context()
print("Connecting to transmitter")
socket = context.socket(zmq.PAIR)
socket.setsockopt(zmq.SNDTIMEO, 1000)
socket.connect("tcp://%s:%i"%(host, port))
print("Connected")

# send downlink messages every 5 sec
while (True):
    print("low resolution")
    socket.send_string("0000000\0")
    time.sleep(5)
    print("high resolution")
    socket.send_string("1111111\0")
    time.sleep(5)

