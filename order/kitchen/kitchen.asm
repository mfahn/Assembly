%include "/usr/local/share/csc314/asm_io.inc"
segment .data
	message 	db 		"The order is ",0
	lettuce 	db 		"Order needs lettuce",0
	tomato		db		"Order needs tomato",0
	onions 		db		"Order needs onions",0
	start 		db 		"Scan a number ",0
segment .bss
segment .text
	global  asm_main
asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	mov 	eax, start
	call 	print_string
	call 	read_int

	mov 	ecx, eax
	xor 	ecx,100
	mov 	eax, message
	call 	print_string
	mov 	eax,ecx
	call 	print_int
	call 	print_nl

	;check for lettuce


	;check for tomato


	;check for onions

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
