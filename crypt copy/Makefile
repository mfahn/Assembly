NAME=crypt

all: crypt

clean:
	rm -rf crypt crypt.o

crypt: crypt.asm
	nasm -f elf -F dwarf -g crypt.asm
	gcc -g -m32 -o crypt crypt.o -static /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o