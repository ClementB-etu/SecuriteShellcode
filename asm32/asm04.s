section .bss
    input: resb 64
    input_len: equ $-input

section .data
    prompt     db      "Entrer un nombre (retourne 1 si impair, 0 sinon):"
    prompt_len equ     $ - prompt
section .text
global _start

_start:

    mov edx,prompt_len ;affiche prompt
    mov ecx,prompt 
    mov ebx,1   ;file descriptor (stdout)
    mov eax,4
    int 80h

    ; input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, input_len
    int 0x80

    ; cmp pair
    mov eax, [input]
    and eax, 1
    cmp eax, 0
    je si_pair

    ; 1 si impair
    mov eax, 1
    mov ebx, 1
    int 0x80

si_pair:
    mov eax, 1
    mov ebx, 0
    int 0x80