#!/usr/bin/env bash

function drawSeparator {
    for i in {0..50}; do 
         printf "="; 
    done
    printf "\n"
}

for month in {01..09}; do
    for day in {01..30}; do

	fileName="log_2017-$month-$day.txt"

	# First create files/delete file's content
	echo > $fileName
	
	# Generate random input to prepopulate files
	for line in {1..7}; do
	    content=$(( (RANDOM % 30) + 1))
	    echo "Line #$line: = $content;" >> $fileName
        done

	# Debug output
	drawSeparator	
	echo "File overwritten: $fileName with:"
	cat $fileName
	drawSeparator
	printf "\n"

    done
done


# To look in files from specified range for lines containing value greater than 25
# find -name "*-0[4-5]-0[7-8].txt" -exec grep -i line {} + | cut -d " " -f 4 | cut -d ";" -f 1 | awk '$1>20'i
