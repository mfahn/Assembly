NAME=sort

all: sort

clean:
	rm -rf sort sort.o

sort: sort.asm
	nasm -f elf -F dwarf -g sort.asm
	gcc -g -m32 -o sort sort.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
