%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	call			
	mov 	eax, 1 ; puts a 1 in eax
	mov 	ebx, 2

	mov 	ecx, 0
	mov 	ecx, ebx ; ecx=ebx
	add 	ecx, eax ;ecx+=eax

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
