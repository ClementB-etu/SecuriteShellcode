#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <stddef.h>

int main(int argc, char *argv[]) {
    
    if (argc<2) {
        printf("usage : ./wrapper $(python2 -c \"print(\'SHELLCODE\')\")");
        return 1;
    }

    char * shellcode = argv[1];
    size_t sclen = strlen(shellcode);

    printf("Len of shellcode : %ld\n", sclen);


    int (*ret)() = (int(*)())shellcode;
    ret();

    return 0;
}