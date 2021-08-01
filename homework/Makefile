NAME=homework

all: homework

clean:
	rm -rf homework homework.o

homework: homework.asm
	nasm -f elf -F dwarf -g homework.asm
	gcc -g -m32 -o homework homework.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
