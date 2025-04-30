#!/bin/bash

# Q2.2_salary_scale_table.sh
# Author: Ian Molyneaux
# Date: 28/04/2025
# Description: Generate a salary scale based on user input

# Input validation function for numeric values
get_number_input() {
	local prompt="$1"
	local input

	while true; do
		read -p "$prompt" input

		if [[ "$input" =~ ^[0-9]+$ ]]; then
			echo "$input"
			break
		else
			echo "Invalid input. Please enter a positive whole number." >&2
		fi
	done
}

# Wrapped generator in a rerun loop
again=""

until [[ "$again" == "no" || "$again" == "n" ]]; do

	#Welcome message
	echo "----------------------------------------"
	echo " Welcome to the Salary Scale Generator "
	echo "----------------------------------------"
	echo

	# User input Starting Salary
	starting_salary=$(get_number_input "Enter starting salary: ")
	echo "Starting Salary: $starting_salary"

	# User input Salary Point
	number_of_points=$(get_number_input "Enter number of points on salary scale: ")
	echo "Number of Points: $number_of_points"

	# User input Salary Increment
	salary_increment=$(get_number_input "Enter salary increment: ")
	echo "Salary Increment: $salary_increment"

	# Check if employee is a Manager
	echo "Is the employee a manager? (yes/no):"
	read is_manager
	# Ensures input here is not case sensitive
	is_manager=$(echo "$is_manager" | tr '[:upper:]' '[:lower:]')

	# Getting the current year as starting point for Salary
	current_year=$(date +%Y)

	# Loop for salary scale calculation
	salary=$starting_salary
	year=$current_year

	# Table header dividing year and salary
	echo
	printf "%-10s | %-15s\n" "Year" "Salary (€)"   
	echo "----------------------------------------"

	for increment_number in $(seq 1 $number_of_points)
	do
		printf "%-10s | €%'14.2f\n" "$year" "$salary"

		# Store last salary for final summary
		last_salary=$salary
	
		# Increase salary
		salary=$((salary + salary_increment))

		# Advance year based on manager status
		if [[ "$is_manager" == "yes" || "$is_manager" == "y" ]]; then
			# Two increments per year
			if [ $((increment_number % 2)) -eq 0 ]; then
				year=$((year + 1))
			fi
		else
			# Increment year everytime for regular employee
			year=$((year + 1))
		fi
	done
	
	# Summary of calculation
	echo
	echo "----------------------------------------"
	echo " Salary scale generation completed"
	echo ""
	echo " Increments applied: $number_of_points"
	echo ""
	echo " Final salary: €$(printf "%'.2f" $last_salary)"
	echo "----------------------------------------"

	# Ask user if they want to run it again
	echo
	read -p "Would you like to generate another salary scale? (yes/no): " again
	again=$(echo "$again" | tr '[:upper:]' '[:lower:]')

done

echo "Goodbye!"
exit 0
