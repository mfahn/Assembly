NAME=calc

all: calc

clean:
	rm -rf calc calc.o

calc: calc.asm
	nasm -f elf -F dwarf -g calc.asm
	gcc -g -m32 -o calc calc.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
