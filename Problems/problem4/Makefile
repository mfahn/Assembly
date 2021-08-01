NAME=problem4

all: problem4

clean:
	rm -rf problem4 problem4.o

problem4: problem4.asm
	nasm -f elf -F dwarf -g problem4.asm
	gcc -g -m32 -o problem4 problem4.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
