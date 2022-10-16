#!/usr/bin/bash

# read -> pauses console and allows user to input some string

# read <var_name>
# read -s <var_name> -> read string silently
# read -t <sec> <var_name> -> read within a timeout
# read -n <num_of_char> <var_name> -> read string until the num_of_char is reached
# read -d <delim> <var_name> -> input ends when the specified exit key is pressed

read name
echo "The name is $name"

echo "## Demo of Silent Input, Please Enter a passcode ##"
read -s pass
echo "the passcode is $pass"

echo "## Demo of Timeout Input, Please Enter a string. (3 seconds) ##"
read -t 3 str
echo "The string is $str"

echo "## Upto 5 chars ##"
read -n 5 char
echo "The 5 chars are $char"

echo "## Demo of Delimiter ##"
read -d ! string
echo "The string is $string"
