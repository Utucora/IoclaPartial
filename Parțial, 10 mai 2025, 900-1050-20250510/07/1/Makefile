CC = gcc
CFLAGS = -Wall -m32
LDFLAGS = -m32
BINARIES = file all_pointers

all: $(BINARIES)

file.o: file.c
	$(CC) $(CFLAGS) -c -o $@ $<

all_pointers.o: all_pointers.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o all_pointers file
