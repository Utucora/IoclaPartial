CC = gcc
CFLAGS = -Wall -m32 -Wno-implicit-function-declaration

all: sorcery decode
	
sorcery.o: sorcery.c
	$(CC) $(CFLAGS) -g -c -o $@ $^
	
decode.o: decode.c
	$(CC) $(CFLAGS) -g -c -o $@ $^
	
sorcery: magic.o sorcery.o
	$(CC) $(CFLAGS) -g -o $@ $^
	
decode: decode.o
	$(CC) $(CFLAGS) -g -o $@ $^
	
clean:
	rm -f sorcery decode sorcery.o decode.o

