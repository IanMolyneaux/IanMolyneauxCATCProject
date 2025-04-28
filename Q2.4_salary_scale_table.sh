#!/bin/bash

# Q2.2_salary_scale_table.sh
# Author: Ian Molyneaux
# Date: 28/04/2025
# Description: Generate a salary scale based on user input

# User input Starting salary
echo "Enter starting salary:"
read starting_salary
echo "Starting Salary: $starting_salary"

# Points on salary scale and salary increment
echo "Enter number of points on salary scale:"
read number_of_points

echo "Enter salary increment:"
read salary_increment

echo "Number of Points: $number_of_points"
echo "Salary Increment: $salary_increment"

# Check if employee is a Manager
echo "Is the employee a manager? (yes/no):"
read is_manager

# Getting the current year
current_year=$(date +%Y)

# Loop for salary scale calculation
salary=$starting_salary
year=$current_year
point=1

echo "Year | Salary"

while [ $point -le $number_of_points ]
do
	echo "$year | $salary"
	salary=$(($salary + $salary_increment))
	point=$(($point + 1))
	if [ "$is_manager" = "yes" ]; then
		if [ $(( ($point -1) % 2 )) -eq 0 ]; then
			year=$(($year + 1))
		fi
	else
		year=$(($year + 1))
	fi
done
