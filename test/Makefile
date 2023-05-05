NAME=test

all: test

clean:
	rm -rf test test.o

test: test.asm
	nasm -f elf -F dwarf -g test.asm
	gcc -g -m32 -o test test.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
