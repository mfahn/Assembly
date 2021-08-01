%include "/usr/local/share/csc314/asm_io.inc"
segment .data
	string 	db "Enter 10 numbers",10,0
segment .bss
	array resd 10 
segment .text
	global  asm_main
asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********
	mov 	eax, string
	call 	print_string
;**************************read in the array
	mov 	ebx, 0
	toploop1:
	cmp 	ebx, 10
	je 		end1
		call 	read_int
		mov 	DWORD [array+ebx*4], eax
	inc 	ebx
	jmp 	toploop1
	end1:
;*****************************organize
	mov   	edx, 0
	topsort:
	cmp 	edx,10
		topnequal:
			mov 	eax, DWORD [array+ebx*4]
			mov 	ebx, DWORD [array+ebx*4+4]
			cmp 	eax, ebx
		jge 	endequal
			mov		ecx,eax
			mov 	eax, ebx
			mov 	ebx, ecx
		jmp 	endequal
		endequal:
	endsort:
;******************************print list 
	mov 	ebx, 0
	toploop2:
	cmp 	ebx, 10
	je 		end2	
		mov 	eax, DWORD [array+ebx*4]
		call 	print_int
		call 	print_nl
	inc 	ebx
	jmp 	toploop2
	end2:
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
