CC=gcc
CFLAGS=-I. -g

decode: decode.o bsdecode.o
	$(CC) -o decode decode.o bsdecode.o -lm

.PHONY: clean

clean:
	rm -f decode.o bsdecode.o decode
