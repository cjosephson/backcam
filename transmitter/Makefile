CC=gcc
CFLAGS=-I. -g

inject: backscatter-tx.o
	$(CC) -o inject backscatter-tx.o -lpcap -lczmq -lzmq

.PHONY: clean

clean:
	rm -f inject.o inject
