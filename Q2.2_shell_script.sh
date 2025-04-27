#!/bin/bash

# Script to gather system information and write to a text file for Q2.2

# Output file
outfile="ianMolyneaux.txt"
> "$outfile"

# Date and Time
echo "===== Current Date and Time =====" >> "$outfile"
date >> "$outfile"
echo "" >> "$outfile"

# Hostname
echo "===== Hostname =====" >> "$outfile"
hostname >> "$outfile"
echo "" >> "$outfile"

# Architecture
echo "===== System Architecture =====" >> "$outfile"
arch >> "$outfile"
echo "" >> "$outfile"

# Kernal and OS details
echo "===== Kernel and OS details =====" >> "$outfile"
uname -a >> "$outfile"
echo "" >> "$outfile"

# System Uptime
echo "===== System Uptime =====" >> "$outfile"
uptime >> "$outfile"
echo "" >> "$outfile"

# Current User
echo "===== Current User =====" >> "$outfile"
whoami >> "$outfile"
echo "" >> "$outfile"

# Who is logged in
echo "===== Who is logged in =====" >> "$outfile"
who >> "$outfile"
echo "" >> "$outfile"

# Current Activity
echo "===== Current Activity =====" >> "$outfile"
w >> "$outfile"
echo "" >> "$outfile"

# Table of Processes
echo "===== Table of Processes =====" >> "$outfile"
top -b -n 1 >> "$outfile"
echo "" >> "$outfile"

# Command History
echo "===== Command History =====" >> "$outfile"
history >> "$outfile"
echo "" >> "$outfile"
