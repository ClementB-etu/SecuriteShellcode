#!/usr/bin/env bash
for i in $(objdump -d shell.o -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo