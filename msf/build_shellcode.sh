#! /usr/bin/env bash

nasm -f elf64 -o $2.bin ../$1/$2.s
/opt/metasploit/app/msfvenom -e x64/shikata_ga_nai -f c -a x64 --platform linux -o $2_x64.shellcode < $2.bin
rm $2.bin