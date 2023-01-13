global _start

section .data
msg db  '1337',0x4 ;our dear string
len equ $ - msg  
section .text

_start :
    mov rdx,len ;message length
    mov rcx,msg ;message to write
    mov rbx,1   ;file descriptor (stdout)
    mov rax,4 
    int 80h
    
    mov rax, 1  ;appel système à 1 = return
    mov rbx, 0  ;valeur retournée 
    int 80h     ;echo $? pour voir la valeur retournée par la dernière commande