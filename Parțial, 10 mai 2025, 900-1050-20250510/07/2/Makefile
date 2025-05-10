NASM = nasm
AFILES = file.asm
ASM_FLAGS = -f elf32 -g
LD=gcc
LDFLAGS = -m32 -g

all : file

file: file.o sum_digits.o
	$(LD) $(LDFLAGS) -o $@ $^

%.o : %.asm
	$(NASM) $(ASM_FLAGS) -o $@ $<

clean: 
	rm -f file.o file
