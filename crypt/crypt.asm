segment .data
	welcome db 	"Enter a string to encrypt: ",0
	format  db  "%s",10,0
	encrypt  db "Encrypted %s",10,0
	string	 dd  0
	testing  db  "Made it!",10,0
 
segment .bss


segment .text
	global  main
	extern 	scanf
	extern 	printf

main:
	push	rbp
	mov		rbp, rsp
	;********** CODE STARTS HERE **********
;outstanding problems:
;fix stack management
;compression function
;errors

	mov 	rdi, welcome
	call 	printf
	mov 	rdi, format
	mov 	rsi, string
	call 	scanf
	mov 	r8d, DWORD [string]

	mov 	rdi, testing
	call 	printf
;r8d is string
;r15 is encrypted string
;r9 is counter

;h0 r10
;h1 r11
;h2 r12
;h3 r13
;h4 r14

	mov 	dil, BYTE[string+1]
	call 	printf

;	asciiToHex:
	call 	asciiToHex

;	hex2bin:
	call 	hex2bin

	call 	pad
;	endwbin:

	mov 	rdi, encrypt
	mov 	sil, dil
	call 	printf

	;*********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret

pad:
	mov 	;string holding binary

	findLength:
	cmp 	;new read-in BYTE at variable[rsp + r9] to null or \n
	je 		foundLength
		
	inc 	r9
	jmp 	findLength
	foundLength:
	;r9 has the length of the binary string
	;mov 	BYTE string[rsp+r9+1], 1
	mov 	rcx, r9
	;find 512 % 448
	;pad the binary string with zeroes on the end
	;until it reaches that length
	mov 	r10, 512
	mov 	r11, 448
	idiv 	r10, r11 ;this is the testcase 512 mod 
	mov 	r12, 
	sub 	512, rcx
	;rcx has the number of 0's that will have to be padded on the end
	
	pad0:
	cmp 	r10, r9
	jne 	donePad
		;mov 	stackpointer to accept another bit
		mov 	BYTE string[rsp + r9 + 1], 0
		inc 	r9

	inc 	rdx
	jmp		pad0
	donePad:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;neet to finish
hexToBin:


	mov		rsp, rbp
	pop		rbp
	ret		;return string of 

asciiToHex:
	pop 	rdx
	push 	rdx
;al is the character to translate to hex
	pop 	BYTE[rsp+1]
;bl is the brute force to find the 
	mov 	bl,0
	mov 	r8,0
	untilDone:
	cmp 	al, 10
	jne 	done
		pop 	BYTE[r9+rdx]
		pop		al
		findHex:
		cmp 	al, bl
		je 		foundHex
			inc 	bl
			jmp 	findHex
		foundHex:
		push 	bl
	inc 	r9
	jmp 	untilDone
	done:

	mov 	rsp, rbp
	pop 	rbp
	ret