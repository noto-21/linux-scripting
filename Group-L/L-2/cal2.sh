#!/bin/bash

if [ $# -eq 0 ] # If no arguments presented, then print current month
then
	cal
elif [ $# -eq 1 ] # If one arg, then print specified month in current year
then
	cal $1 $(date +%Y)
elif [ $# -eq 2 ] # If two args, then print specified month in specified year
then
	cal $1 $2
else # Otherwise, echo the proper usage
	echo "Usage: $0 [month] [year]"
fi
