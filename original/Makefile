NAME=original

all: original

clean:
	rm -rf original original.o

original: original.asm
	nasm -f elf -F dwarf -g original.asm
	gcc -g -m32 -o original original.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
