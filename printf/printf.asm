%include "/usr/local/share/csc314/asm_io.inc"


segment .data
str1 	db	 "Hello world",10,0
str2 	db 	 "str3 is '%s', isn't that cool?",10,0
str3 	db 	 "woot woot",10,0
str4 	db 	 "%c is a char, but so is %%, and  again!",10,0
str5 	db 	 "%c is a char, but so is %%, and %s again!", 10,0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********\

	add 	esp, 4 
	push 	str1
	call 	printf

	add 	esp, 4
	push 	str2
	call 	printf

	add 	esp, 4
	push 	str3
	call 	printf

	add 	esp, 4
	push 	str4
	call 	printf

	add 	esp, 4
	push 	'A'
	call 	printf

	add 	esp, 4
	push 	str5
	call 	printf

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

printf:
	push 	ebp
	mov 	ebp, esp
	sub 	ebp, 8
	mov 	DWORD [ebp - 4], 0
	mov 	DWORD [ebp - 8], 12

	mov 	esi, DWORD [ebp - 4]
	toploop1:
	mov 	esi, DWORD [ebp - 4]
	mov 	ebx, DWORD [ebp + 8]
	cmp 	BYTE [ebx + esi], 0
	je 		endloop1
	cmp 	BYTE [ebx+esi], '%';37 ;%	
	je		isC
	jne 	putchar
		isC:
		inc 	esi
		inc 	DWORD [ebp - 4]
		cmp 	BYTE [ebx + esi+1], 'c';99
		jne 		isS
			mov 	edi, DWORD[ebp - 8]
			add 	DWORD [ebp - 8], 4
			mov 	eax, 4
			mov 	ebx, 1
			lea 	ecx, [ebp + edi]
			mov 	edx, 1
			int 	0x80
			inc 	DWORD [ebp - 4]
			jmp 	toploop1

		isS:
		cmp 	BYTE [ebp + esi + 1], 's'
		jne 	putchar
			lea 	ecx, [ebp+4]
			mov 	eax, 4
			mov 	ebx, 1
			mov 	edx, 1
			int 	0x80
			inc 	DWORD [ebp - 4]
			jmp 	toploop1

		putchar:
			lea 	ecx, [ebx + esi]
			mov 	eax, 4
			mov 	ebx, 1
			mov 	edx, 1
			int 	0x80
			inc 	esi
			inc 	DWORD [ebp - 4]
			jmp 	toploop1
	endloop1:

	mov 	esp, ebp
	pop 	ebp
	ret