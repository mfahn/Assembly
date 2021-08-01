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
mov eax, 5
mov ebx, 0x08049b12
mov ecx, 0
mov edx, 0
int 0x80

; sys_read from file into memory
mov ebx, eax
mov eax, 3
mov ecx, 0x08049b12
mov edx, 30
int 0x80

; sys_write memory to terminal
mov eax, 4
mov ebx, 1
mov ecx, 0x08049b12
mov edx, 30
int 0x80

; sys_exit
mov eax, 1
mov ebx, 0
int 0x80

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
