global _start
section .text

_start :
    mov eax, 1  ;appel système à 1 = return
    mov ebx, 0  ;valeur retournée 
    int 80h     ;echo $? pour voir la valeur retournée
                ;./build.sh asm01 pour build