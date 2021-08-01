NAME=shellcode

all: shellcode

clean:
	rm -rf shellcode shellcode.o

shellcode: shellcode.asm
	nasm -f elf -F dwarf -g shellcode.asm
	gcc -g -m32 -o shellcode shellcode.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
