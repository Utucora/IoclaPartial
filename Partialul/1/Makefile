CC = gcc
CFLAGS = -Wall -m32 -Wno-implicit-function-declaration
LDFLAGS = -m32 -no-pie -g
BINARIES = file

all: $(BINARIES)

file.o: file.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o $(BINARIES)
	rm -f *~ 
