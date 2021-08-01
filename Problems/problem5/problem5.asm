%include "/usr/local/share/csc314/asm_io.inc"

segment .data

segment .bss

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	call	read_int
	mov 	ebx, eax
	sub 	ebx, 10
	mov 	edx, ebx

	add 	edx, eax
	sub 	edx, 1
	add 	edx, ebx 	

	add 	eax, edx
	call print_int
	call print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
