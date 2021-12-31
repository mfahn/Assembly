NAME=challenge

all: challenge

clean:
	rm -rf challenge challenge.o

challenge: challenge.asm
	nasm -f elf -F dwarf -g challenge.asm
	gcc -g -m32 -o challenge challenge.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
