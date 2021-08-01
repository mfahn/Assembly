%include "/usr/local/share/csc314/asm_io.inc"

segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	call 	read_int
	mov 	ebx, eax	;a = read_int

	call 	read_int
	mov 	ecx, eax	;a = read_int

	mov 	eax, 36
	idiv 	ebx 	; eax = 36/A 
	
	sub 	eax, ecx
	
	call 	print_int
	call 	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
