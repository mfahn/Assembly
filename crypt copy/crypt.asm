%include "/usr/local/share/csc314/asm_io.inc"
segment .data
	welcome db 	"Enter a string to encrypt: ",0
	format  db  "%s",10,0
	encrypt  db "Encrypted %s",10,0
	string	 dd  0
	testing  db  "Made it!",10,0
 
segment .bss


segment .text
	global asm_main
	extern 	scanf
	extern 	printf

asm_main:
	push	ebp
	mov		ebp, esp
	;********** CODE STARTS HERE **********
;outstanding problems:
;fix stack management
;compression function
;errors

	mov 	edi, welcome
	call 	printf
	mov 	edi, format
	mov 	rsi, string
	call 	scanf

	mov 	edi, testing
	call 	printf
;r8d is string
;r15 is encrypted string
;ebx is counter

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

	mov 	edi, encrypt
	mov 	sil, dil
	call 	printf

	;*********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

pad:
	mov 	;string holding binary

	findLength:
	cmp 	;new read-in BYTE at variable[esp + ebx] to null or \n
	je 		foundLength
		
	inc 	ebx
	jmp 	findLength
	foundLength:
	;ebx has the length of the binary string
	;mov 	BYTE string[esp+ebx+1], 1
	mov 	rcx, ebx
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
	cmp 	r10, ebx
	jne 	donePad
		;mov 	stackpointer to accept another bit
		mov 	BYTE string[esp + ebx + 1], 0
		inc 	ebx

	inc 	edx
	jmp		pad0
	donePad:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;neet to finish
hexToBin:


	mov		esp, ebp
	pop		ebp
	ret		;return string of 

asciiToHex:
	pop 	edx
	push 	edx
;al is the character to translate to hex
	pop 	BYTE[esp+1]
;bl is the brute force to find the 
	mov 	bl,0
	mov 	r8,0
	untilDone:
	cmp 	al, 10
	jne 	done
		pop 	BYTE[ebx+edx]
		pop		al
		findHex:
		cmp 	al, bl
		je 		foundHex
			inc 	bl
			jmp 	findHex
		foundHex:
		push 	bl
	inc 	ebx
	jmp 	untilDone
	done:

	mov 	esp, ebp
	pop 	ebp
	ret