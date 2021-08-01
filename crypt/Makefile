NAME=crypt

all: crypt

clean:
	rm -rf crypt crypt.o

crypt: crypt.asm
	nasm -f elf64 -F dwarf -g crypt.asm
	gcc -g -m64 -o crypt crypt.o -static