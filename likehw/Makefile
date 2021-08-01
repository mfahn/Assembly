NAME=likehw

all: likehw

clean:
	rm -rf likehw likehw.o

likehw: likehw.asm
	nasm -f elf -F dwarf -g likehw.asm
	gcc -g -m32 -o likehw likehw.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
