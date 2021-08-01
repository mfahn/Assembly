NAME=kitchen

all: kitchen

clean:
	rm -rf kitchen kitchen.o

kitchen: kitchen.asm
	nasm -f elf -F dwarf -g kitchen.asm
	gcc -g -m32 -o kitchen kitchen.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
