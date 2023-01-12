global _start
section .text

_start :
    mov rax, 1  ;appel système à 1 = return
    mov rbx, 0  ;valeur retournée 
    int 80h     ;echo $? pour voir la valeur retournée par la dernière commande
                ;./build.sh asm01 pour build