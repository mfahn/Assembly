%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; sys_open file
push 5
pop eax
xor ecx, ecx
push 0x08049b12
pop ebx
cdq
int 0x80

; sys_read from file into memory
push 0x08049b12
pop ecx
push 0xFFFFFFF2
pop ebx
push 3
pop eax
push 30
pop edx
int 0x80

; sys_write memory to terminal
cdq
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
