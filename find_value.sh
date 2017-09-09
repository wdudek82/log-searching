#!/usr/bin/env bash


greaterThan=${1:-20}

echo "Find in files lines containing vlaues greater than $greaterThan"
find -name "*-0[4-5]-0[7-8].txt" -exec grep -i line {} + | 
	cut -d " " -f 4 | 
	cut -d ";" -f 1 | 
	awk -v var="$greaterThan" '$1>var'
