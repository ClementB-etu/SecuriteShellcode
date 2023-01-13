#!/usr/bin/env bash
objdump -d $1 | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
#1) grep : récupères les bytes et les affiche en colonne (50 68 ...)
#2) sed : ajoute \x avant les bytes
#3) perl : affiche le résultat en ligne
#4) sec : ajoute un retour à la ligne pour affichage