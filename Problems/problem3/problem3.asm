%include "/usr/local/share/csc314/asm_io.inc"

segment .data

segment .bss

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov eax, 0x123
	add eax, 0x456
	add eax, 0x789
	add eax, 0xabcd

	call print_int
	call print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
