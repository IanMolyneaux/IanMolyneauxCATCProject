#!/bin/bash

# Q2.2_salary_scale_table.sh
# Author: Ian Molyneaux
# Date: 28/04/2025
# Description: Generate a salary scale based on user input

#Welcome message
echo "---------------------------------------"
echo " Welcome to the Salary Scale Generator "
echo "---------------------------------------"
echo
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
is_manager=$(echo "$is_manager" | tr '[:upper:]' '[:lower:]') #user input is not case sensitive

#if "yes", double increment of salary per year
if [ "$is_manager" = "yes" ]; then
	number_of_points=$((number_of_points * 2))
fi

# Getting the current year
current_year=$(date +%Y)

# Loop for salary scale calculation
salary=$starting_salary
year=$current_year
point=1

echo
printf "%-10s | %-15s\n" "Year" "Salary"
echo "-------------------------------------"

while [ $point -le $number_of_points ]
do
	printf "%-10s | %-15s\n" "$year" "$salary"

	# Increase salary
	salary=$((salary + salary_increment))

	# Advance year based on manager status
	if [ "$is_manager" = "yes" ]; then
		if [ $(( (point) % 2 )) -eq 0 ]; then
			year=$((year + 1))
		fi
	else
		year=$((year + 1))
	fi

	# Move to next point
	point=$((point + 1))
done

echo
echo "--------------------------------------"
echo " Salary scale generation completed"
echo "--------------------------------------"
