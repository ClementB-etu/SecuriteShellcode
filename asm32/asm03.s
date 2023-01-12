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

    mov edx,prompt_len ;affiche prompt
    mov ecx,prompt 
    mov ebx,1   ;file descriptor (stdout)
    mov eax,4
    int 80h

    ;Entrée utilisateur
    mov edx,uinput_len ;message length
    mov ecx,uinput ;message to write
    mov ebx,0   ;file descriptor (stdin)
    mov eax,3
    int 80h

    SI1:
        mov ax, [msgcmp]
        mov bx, [uinput]
        cmp bx, ax
        jne SINON1

    ALORS1: ;si uinput == '42', alors on affiche 1337 et on retourne 0
        mov edx,len_msg ;message length
        mov ecx,msg ;message to write
        mov ebx,1   ;file descriptor (stdout)
        mov eax,4 
        int 80h
        
        mov eax, 1  ;appel système à 1 = return
        mov ebx, 0  ;valeur retournée 
        int 80h     ;echo $? pour voir la valeur retournée par la dernière commande

    SINON1: ;sinon, on retourne 1
        mov eax, 1  ;appel système à 1 = return
        mov ebx, 1  ;valeur retournée 
        int 80h     ;echo $? pour voir la valeur retournée par la dernière commande