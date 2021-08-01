%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	;eax, ebx, ecx, edx, esi, edi, [ebp, esp]<-don't use these <-
	mov		ebx, 62
	sub 	ebx, 4
	
	mov 	ecx, ebx
	add 	ecx, ebx


	move	eax, ecx
	call 	print_int
	;call 	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
