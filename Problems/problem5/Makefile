NAME=problem5

all: problem5

clean:
	rm -rf problem5 problem5.o

problem5: problem5.asm
	nasm -f elf -F dwarf -g problem5.asm
	gcc -g -m32 -o problem5 problem5.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
