%include "/usr/local/share/csc314/asm_io.inc"

segment .data

prompt1 db "Array: ", 10, 0

segment .bss
        myArr resd 5

segment .text
        global  asm_main

asm_main:
    push    ebp
    mov     ebp, esp
    ; ********** CODE STARTS HERE **********

    push    myArr
    mov     eax, 5
    push    eax
    call    fillarr
    add     esp, 8


    ; *********** CODE ENDS HERE ***********
    mov     eax, 0
    mov     esp, ebp

    ret

fillarr:
    push    ebp
    mov     ebp, esp

    mov     edx, [ebp+8] ; array

    mov     ecx,[ebp+12] ; how big the array is
    mov     ebx, 0
    loop1:
        mov     [eax],  edx
        add     [eax], ebx
        inc     ebx
        loop    loop1

    mov             esp, ebp
    ret

printarr:
    push    ebp
    mov             ebp, esp

    mov             esp, ebp
    ret
