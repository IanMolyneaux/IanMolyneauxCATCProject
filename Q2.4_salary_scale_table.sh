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

# Getting the current year
current_year=$(date +%Y)

# Loop for salary scale calculation
salary=$starting_salary
year=$current_year
increment_number=1

echo
printf "%-10s | %-15s\n" "Year" "Salary (€)"   
echo "-------------------------------------"

while [ $increment_number -le $number_of_points ]
do
	printf "%-10s | €%'14.2f\n" "$year" "$salary"

	# Store last salary for final summary
	last_salary=$salary

	# Increase salary
	salary=$((salary + salary_increment))

	# Advance year based on manager status
	if [ "$is_manager" = "yes" ]; then
		# Two increments per year
		if [ $((increment_number % 2)) -eq 0 ]; then
			year=$((year + 1))
		fi
	else
		# Increment year everytime for regular employee
		year=$((year + 1))
	fi

	increment_number=$((increment_number + 1))
done

echo
echo "-------------------------------------------"
echo " Salary scale generation completed"
echo ""
echo " Increments applied: $number_of_points"
echo ""
echo " Final salary: €$(printf "%'.2f" $last_salary)"
echo "-------------------------------------------"

# Loop Generator
echo
read -p "Would you like to generate another salary scale? (yes/no): " again
again=$(echo "$again" | tr '[:upper:]' '[:lower:]')

if [[ "$again" == "yes" || "%again" == "y" ]]; then
	echo
	exec "$0"
else
	echo "Goodbye!"
	exit 0
fi
