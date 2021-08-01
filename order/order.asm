%include "/usr/local/share/csc314/asm_io.inc"

segment .data
	string 		db 		"Your code is ",0
	message		db		"Your Kraby Patty order is ready!",10,0
	lmessage	db 		"Would you like Lettuce y o n ",0
	tmessage 	db 	 	"Would you like Tomato ",0
	omessage 	db 	 	"Would you like Onions ",0

segment .bss
	
segment .text
	global  asm_main
asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	mov		ecx, 0
	mov 	eax, lmessage
	call 	print_string
	call 	read_char
	mov 	esi,eax
	call 	read_char
	mov 	eax, esi
	beg1: 	
	cmp 	eax,'y'
	jne 	end1
		or 		ecx,00000001b
	end1:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov 	eax, tmessage
	call 	print_string
	call 	read_char
	mov 	esi,eax
	call 	read_char
	mov 	eax, esi
	beg2: 	
	cmp 	eax,'y'
	jne 	end2
		or 		ecx,00000010b
	end2:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov 	eax, omessage
	call 	print_string
	call 	read_char
	mov 	esi,eax
	call 	read_char
	mov 	eax, esi
	beg3: 	
	cmp 	eax,'y'
	jne 	end3
		or 		ecx,00000100b
	end3:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov 	eax, ecx
	call 	print_int
	call 	print_nl
	xor		ecx, 100
	mov 	eax, ecx
	call 	print_int
	call 	print_nl
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret