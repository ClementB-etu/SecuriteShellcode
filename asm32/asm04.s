section .bss
    input resb 16

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
    mov edx, 16
    int 80h

    mov ecx, 16 ;16 : taille du buff
loop:
    mov al,[input+ecx]
    cmp al, 10 ;comparaison avec saut de ligne
    je check_pair

    dec ecx
    cmp ecx, 0
    je end
    jmp loop

check_pair:
    mov eax, input
    add eax, ecx ; ecx est à la position du saut de ligne
    dec eax ; Juste avant ecx, dernier caractère de l'input 
    mov bl, [eax]
    and bl, 1
end:
    mov eax, 1
    ;mov ebx, 0 ;bl dépend de la parité du nombre, ebx est 0 ou 1 suivant la parité avec le and
    int 80h