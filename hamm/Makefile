NAME=hamm

all: hamm

clean:
	rm -rf hamm hamm.o

hamm: hamm.asm
	nasm -f elf -F dwarf -g hamm.asm
	gcc -g -m32 -o hamm hamm.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
