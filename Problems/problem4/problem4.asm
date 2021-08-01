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
	mov		ebx, eax
	call	read_int
	move	ecx, eax
	call 	read_int

	add 	eax, ebx
	add 	eax, ecx

	call print_int
	call print_nl

;	mov 	edx, 0
;	add 	edx, ebx
;	add 	edx, ecx
;	add 	edx, eax
;
;	mov 	eax, edx

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
