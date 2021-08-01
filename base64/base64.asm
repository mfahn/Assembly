segment .data
	format	db	"%d",0
	lowest 	db 	"Lowest number %d",10,0
	highest	db	"Highest number %d",10,0
	total	db	"Total of numbers %d",10,0
	num		dd	0

segment .bss


segment .text
	global  main
	extern scanf
	extern printf

main:
	push	rbp
	mov		rbp, rsp
	; ********** CODE STARTS HERE **********
;r12 r12 is counter
;r13 r13 is total
;r14 r14 is smallest
;r15 is largest

	mov 	r14, 2100000000
	mov 	r12, 0
	mov 	r13, 0

	mov 	r15, 0
	start1:
	cmp 	r12, 10
	je 		end1
		mov 	rdi, format
		mov 	rsi, num
		call 	scanf
		mov 	eax, DWORD [num]
		largstart:
		cmp 	r15d, DWORD[num]
		jge		endlarg
			mov 	r15d, DWORD[num]
			jmp 	endlarg
		endlarg:
		smallstart:
		cmp 	r14d, DWORD [num]
		jle 	endsmall
			mov 	r14d, DWORD[num]
			jmp 	endsmall
		endsmall:
		add 	r13d, DWORD[num]
		inc 	r12
		jmp 	start1
	end1:

	mov 	rdi, highest
	mov 	rsi, r15
	call 	printf

	mov 	rdi, lowest
	mov 	rsi, r14
	call 	printf

	mov 	rdi, total
	mov 	rsi, r13
	call 	printf


	; *********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret
