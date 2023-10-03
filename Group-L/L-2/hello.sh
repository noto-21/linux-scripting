#!/bin/bash
#Indicates to use bash

if [ $1 = "Hello" ] && [ $2 = "World" ] && [ $# -eq 2 ] # If the arguments are only "Hello" and "World", print them
then
	echo $1 $2
else
	echo "Usage: $0 'Hello' 'World' (Ensure Capitalization!)" # If these conditions do not hold, then print the intended usage
fi
