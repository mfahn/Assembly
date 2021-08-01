%include "/usr/local/share/csc314/asm_io.inc"

segment .data

	format	db	"Hamming distance = %d",10,0
	make	db 	"test",10,0
	; the hamming distance between these is 1
	str1	db	"bext",0
	str2	db	"tsxt",0

segment .bss

segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	;***************CODE STARTS HERE***************************

	push 	str1
	push 	str2
	; call your ham dist function here
	call 	hamdist
	; pass str1 and str2 as arguments

	
	; result gets returned in EAX

	push	eax		; the returned integer from hamdist()
	push	format	; "Hamming distance = %d\n"
	call	printf
	add		esp, 8

	;***************CODE ENDS HERE*****************************
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

hamdist:
	push	ebp
	mov		ebp, esp

	mov 	edx,0	;memory counter
	mov 	ecx,0	;number of different letters

	mov 	ecx,DWORD [ebp+8] ; string 1
	mov 	edx,DWORD [ebp+12] ; string 2

	mov		DWORD [ebp+8], 0 ;memory counter
	mov		DWORD [ebp+12], 0 ;number of different letters
	nextletter:
	mov		ebx, DWORD [ebp+8]
	cmp 	BYTE [ecx+ebx*1], 0

	je 		end
	mov 	al, BYTE [ecx+ebx*1]
	mov 	ah, BYTE [edx+ebx*1]
	cmp 	al, ah
	jne 	nequal
		inc 	DWORD [ebp+8]
		jmp 	nextletter
		nequal:
			inc 	DWORD [ebp+8]
			inc 	DWORD [ebp+12]
			jmp 	nextletter
	end:

	mov		eax, DWORD [ebp+12]

	mov		esp, ebp
	pop		ebp
	ret