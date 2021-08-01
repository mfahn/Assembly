segment .data
	welcome db 	"Enter a string to encrypt: ",10,0
	format  db  "%s",10,0
	encrypt  db "Encrypted %s",10,0
	string	 dd  0
	testing  db  "Made it!",10,0

segment .bss


segment .text
	global  main
	extern printf
	extern scanf
	extern srand

main:
	push	rbp
	mov		rbp, rsp
	; ********** CODE STARTS HERE **********
;r8 ,r9, r10, r11 ,12, 13, 14, 15, rdx, rcx, rax, rbx
	
	mov 	rdi, welcome
	mov 	rsi, string
	call	scanf
	mov 	rax, scanf

	mov 	rdi, encrypt
	mov 	rsi, string
	call	printf

	; *********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret

