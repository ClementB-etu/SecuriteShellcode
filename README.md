# SecuriteShellcode

Activités du cours SecuriteShellcode

BELLEIL Clément - ING3 CYBERSECURITE GROUPE A

# Compilation et Execution

Compilation :   - se placer dans le dossier asm32 ou asm64 ET ./build.sh asm01 par exemple

Execution :     - ./asm01

# Création de shellcode

Après compilation du programme :

Création de shellcode : ./create_shellcode {asm32 OU asm64} {asm01,...}

#Msfvenom - création de shellcodes (exemple pour asm32/asm01)

Compilation : nasm -f bin -o asm01.bin asm01.s                                                 
Création du payload : msfvenom -e x86/shikata_ga_nai -f c -a x86 -o asm01_x86.shellcode --platform linux < asm01.bin

