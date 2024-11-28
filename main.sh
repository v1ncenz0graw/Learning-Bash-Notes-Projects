#!/usr/bin/env bash

# Creates new text file
touch output.txt

# Writes current date to text file
DATE=$(date +%d/%m/%Y)
echo "Today: ${DATE}" >output.txt

# Writes Fullname to text file
echo "Fullname: $1 $2" >>output.txt

# Creates backup for text file
cp output.txt output_backup.txt

# Prints content of text file
cat <output.txt
