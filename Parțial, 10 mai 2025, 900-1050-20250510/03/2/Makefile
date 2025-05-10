NASM = nasm
ASM_FLAGS = -f elf32 -g
LD=gcc
LDFLAGS = -m32 -g -no-pie
CC=gcc
CCFLAGS = -m32 -g -c
BINARIES = emitter attack passwords

all : $(BINARIES)

%.o : %.asm
	$(NASM) $(ASM_FLAGS) -o $@ $<

%.o : %.c
	$(CC) $(CCFLAGS) -o $@ $<

emitter: emitter.o
	$(LD) $(LDFLAGS) -o $@ $^
	
attack: attack.o broadcast.o
	$(LD) $(LDFLAGS) -o $@ $^
	
passwords: passwords.o
	$(LD) $(LDFLAGS) -o $@ $^

clean: 
	rm -f emitter.o attack.o passwords.o $(BINARIES)

