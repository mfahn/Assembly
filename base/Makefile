NAME=base

all: base

clean:
	rm -rf base base.o

base: base.asm
	nasm -f elf -F dwarf -g base.asm
	gcc -g -m32 -o base base.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
