%include "/usr/local/share/csc314/asm_io.inc"


segment .data
	myname db "=",1,0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	read_int
	mov 	edx, eax
	call 	read_char
	call 	read_char
	mov 	cl, al
	call	read_int
	mov 	ebx, eax
	mov 	eax, edx
	
	cmp 	cl, '+'
	jne 	endplus
		add 	eax, ebx
	endplus:

	cmp  	cl, '*'
	jne  	endmult
		imul 	ebx
	endmult:

	cmp 	cl, '-'
	jne 	endsub
		sub 	eax, ebx
	endsub:

	cmp  	cl, '/'
	jne  	enddiv
		cdq
		idiv 	ebx
	enddiv:

	cmp 	cl, '%'
	jne 	endmod
		cdq
		idiv 	ebx
		mov 	eax, edx
	endmod:

	mov 	esi, 0
	
	cmp  	cl, '^'
	startloop:
		inc 	esi
		cmp 	esi, ebx
		jge  	endex
			imul 	ebx
			jmp 	startloop
	endex:

;print the answer
	mov 	ebx, eax
	mov 	eax, myname
	call  	print_string
	call 	print_nl
	mov 	eax, ebx
	call 	print_int
	call 	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
