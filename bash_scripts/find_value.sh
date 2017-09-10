#!/usr/bin/env bash


# Default value for $1
greaterThan=${1:-20}

echo "Find in files lines containing vlaues greater than $greaterThan"

find -name "*-0[4-5]-0[7-8].txt" -exec grep -i line {} + | 
	cut -d " " -f 4 | 
	cut -d ";" -f 1 | 
	awk -v var="$greaterThan" '$1>var' | 
	tee /dev/tty |  # Redirect output to TTY instead of to file 
	echo "Found: $(wc -l)"  # Print summary
