section .bss
    input resb 16

section .data
    prompt     db      "Entrer un nombre (retourne 0 si pair, 1 sinon):"
    prompt_len equ     $ - prompt
section .text
global _start

_start:

    mov edx,prompt_len ;affiche prompt
    mov rcx,prompt 
    mov rbx,1   ;file descriptor (stdout)
    mov rax,4
    int 80h

    ; input
    mov rax, 3
    mov rbx, 0
    mov rcx, input
    mov edx, 16
    int 80h

    mov rcx, 16 ;16 : taille du buff
loop:
    mov al,[input+rcx]
    cmp al, 10 ;comparaison avec saut de ligne
    je check_pair

    dec rcx
    cmp rcx, 0
    je end
    jmp loop

check_pair:
    mov rax, input
    add rax, rcx ; rcx est à la position du saut de ligne
    dec rax ; Juste avant rcx, dernier caractère de l'input 
    mov bl, [rax]
    and bl, 1
end:
    mov rax, 1
    ;mov rbx, 0 ;bl dépend de la parité du nombre, rbx est 0 ou 1 suivant la parité avec le and
    int 80h