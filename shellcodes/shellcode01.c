//COMPILATION : gcc -fno-stack-protector -z execstack shellcode01.c -o shellcode01

#include <stdio.h>
#include <unistd.h> 
#include <stdlib.h>

void main() {
    char *name[2];

    name[0] = "/bin/sh";
    name[1] = NULL;
    execve(name[0], name, NULL);
    exit(0);
}

/*      Shellcode obtenu (pour tester le wrapper) avec un programme similaire à celui ci (développé en asm donc beaucoup moins volumineux) :
        \x50\x48\x31\xd2\x48\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x54\x5f\xb0\x3b\x0f\x05
*/