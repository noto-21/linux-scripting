#!/bin/bash

if [ $# -eq 0 ] # If no arguments, then warn the user
then
	echo "You must input one integer [1-12] as an argument!"
elif [ $# -eq 1 ] # If one argument, then print the specified month in the current year
then
	cal $1 $(date +%Y)
elif [ $# -eq 2 ] # If two args, then print specified month in current year and warn the user about too many args
then
	cal $1 $(date +%Y)
	echo "You must input one integer for MONTH [1-12] only!"
else # If nothing else applies, then remind the user of proper usage
	echo "Usage: $0 [month]"
fi
