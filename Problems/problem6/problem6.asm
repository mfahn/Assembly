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
	mov		ebx, eax	;x
	call	read_int
	mov		ecx, eax	;y
	call 	read_int
	mov		edx, eax	;z

	add 	ebx, ebx	;a
	add 	ebx, ebx
	
	mov 	eax, ebx	;b
	sub 	eax, 19
	add 	eax, ecx	

	mov 	esi, edx	;c
	sub 	esi, ebx
	add 	esi, 10

	mov 	edi, ebx
	mov 	edi, eax
	mov 	edi, esi

	mov 	eax, edi

	call 	print_int
	call 	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
