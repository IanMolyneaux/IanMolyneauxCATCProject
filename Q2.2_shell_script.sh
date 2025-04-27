#!/bin/bash

# Script to gather system information and write to a text file for Q2.2

outfile="ianMolyneaux.txt"

echo "Current Date and Time:" >> "$outfile"
date >> "$outfile"
echo "" >> "$outfile"

echo "Hostname:" >> "$outfile"
hostname >> "$outfile"
echo "" >> "$outfile"

echo "System Architecture:" >> "$outfile"
arch >> "$outfile"
echo "" >> "$outfile"

echo "Kernel and OS details:" >> "$outfile"
uname -a >> "$outfile"
echo "" >> "$outfile"

echo "System Uptime:" >> "$outfile"
uptime >> "$outfile"
echo "" >> "$outfile"

echo "Current User:" >> "$outfile"
whoami >> "$outfile"
echo "" >> "$outfile"

echo "Who is logged in:" >> "$outfile"
who >> "$outfile"
echo "" >> "$outfile"

echo "Current Activity:" >> "$outfile"
w >> "$outfile"
echo "" >> "$outfile"

echo "Table of Processes (press q to quit):" >> "$outfile"
top -b -n 1 >> "$outfile"
echo "" >> "$outfile"

echo "Command History:" >> "$outfile"
history >> "$outfile"
echo "" >> "$outfile"
