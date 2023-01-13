global _start

section .bss
    uinput: resb 64
    uinput_len: equ $-uinput ; buffer for user input : doit être dans section .bss car 'uninitialized space declared'
    
section .data

    msg: db '1337', 10
    len_msg: equ $-msg

    msgcmp: db '42'

    prompt     db      "Entrer du texte :"
    prompt_len equ     $ - prompt


section .text

_start :

    mov rdx,prompt_len ;affiche prompt
    mov rcx,prompt 
    mov rbx,1   ;file descriptor (stdout)
    mov rax,4
    int 80h

    ;Entrée utilisateur
    mov rdx,uinput_len ;message length
    mov rcx,uinput ;message to write
    mov rbx,0   ;file descriptor (stdin)
    mov rax,3
    int 80h

    SI1:
        mov ax, [msgcmp]
        mov bx, [uinput]
        cmp bx, ax
        jne SINON1

    ALORS1: ;si uinput == '42', alors on affiche 1337 et on retourne 0
        mov rdx,len_msg ;message length
        mov rcx,msg ;message to write
        mov rbx,1   ;file descriptor (stdout)
        mov rax,4 
        int 80h
        
        mov rax, 1  ;appel système à 1 = return
        mov rbx, 0  ;valeur retournée 
        int 80h     ;echo $? pour voir la valeur retournée par la dernière commande

    SINON1: ;sinon, on retourne 1
        mov rax, 1  ;appel système à 1 = return
        mov rbx, 1  ;valeur retournée 
        int 80h     ;echo $? pour voir la valeur retournée par la dernière commande