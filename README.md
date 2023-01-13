# SecuriteShellcode

Activités du cours SecuriteShellcode

BELLEIL Clément - ING3 CYBERSECURITE GROUPE A

# Compilation et Execution

Compilation :   - se placer dans le dossier asm32 ou asm64 ET ./build.sh asm01 par exemple

Execution :     - ./asm01

# Création de shellcode

Après compilation du programme :

Création de shellcode : ./create_shellcode {asm32 OU asm64} {asm01,...}

#Création des shellcodes 

Après compilation des executables que nous voulons transformer en shellcode : 

msfvenom -a x86 --platform linux -e x86/shikata_ga_nai -f c -o asm01_x86.shellcode < asm32/asm01 par exemple
