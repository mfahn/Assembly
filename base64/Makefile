NAME=base64

all: base64

clean:
	rm -rf base64 base64.o

base64: base64.asm
	nasm -f elf64 -F dwarf -g base64.asm
	gcc -g -m64 -o base64 base64.o -static
