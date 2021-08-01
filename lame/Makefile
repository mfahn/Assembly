NAME=lame

all: lame

clean:
	rm -rf lame lame.o

lame: lame.asm
	nasm -f elf64 -F dwarf -g lame.asm
	gcc -g -m64 -o lame lame.o -static