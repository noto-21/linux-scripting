#!/bin/bash

# Check for arguments
if [ $# -ne 1 ]; then
	echo "Usage: '$0 [directory path]'"
	exit 1
fi

# Check if arg is directory
if [ ! -d "$1" ]; then
	echo "'$1' is not a directory path!"
	exit 1
fi

echo "List of file/folder sizes in '$1':"

# ls: -l for a detailed list, -S to sort list by file size in descending order, -F to classify each file using a special char
# awk: 'NR > 1' prints each line but the first ('total' size display, unnecessary), ternary checks the last char of each line
#	to specify file type in output, '$9' is the file name and '$5' is the file size in bytes
# exit: Exit with code '0' to indicate success to Bash; '1' to indicate failure
ls -lSF "$1" | awk 'NR > 1 {
print (substr($0, length($0)) == "/" ? "[Dir.] - " : substr($0, length($0)) == "*" ? "[Exe.] - " : "[File] - ") $9 ": "$5 " Bytes"
}'

exit 0

