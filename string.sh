#!/usr/bin/bash

# Relational Operators

# =   two strings are the same 
# ==  two strings are the same 
# !=  two strings are NOT the same
# =~  does the string on the left match the regular expression on the right
# >   test alphabetical order (does the string on the left come after the string on the left in alphabetical order)
# <   test alphabetical order (does the string on the left come before the string on the left in alphabetical order)
# -Z  is Empty
#-n   is NOT Empty

# [[ ]] for pattern Matching 

STR1="String1"
STR2="String2"

if [[ "$STR1" != "$STR2" ]]
then
	echo "True"
else
	echo "False"
fi
