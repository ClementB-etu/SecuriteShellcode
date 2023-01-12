global _start

section .data
msg db  '1337',0x4 ;our dear string
len equ $ - msg  
section .text

_start :
    mov edx,len ;message length
    mov ecx,msg ;message to write
    mov ebx,1   ;file descriptor (stdout)
    mov eax,4 
    int 80h
    
    mov eax, 1  ;appel système à 1 = return
    mov ebx, 0  ;valeur retournée 
    int 80h     ;echo $? pour voir la valeur retournée par la dernière commande