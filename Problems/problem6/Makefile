NAME=problem6

all: problem6

clean:
	rm -rf problem6 problem6.o

problem6: problem6.asm
	nasm -f elf -F dwarf -g problem6.asm
	gcc -g -m32 -o problem6 problem6.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
