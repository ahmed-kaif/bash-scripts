#!/usr/bin/bash

echo "Hello I am kaif"

VAR="Again"
echo $VAR

# Relational Operators

# -eq or == equal to 
# -ne or != not equal to
# -gt or >  greater than
# -lt or <  less than
# -ge or >= greater than or equal
# -le or <= less than or equal

v1=5
v2=5

if [ $v1 -eq $v2 ]
then
	echo "True"
else
	echo "False"
fi
