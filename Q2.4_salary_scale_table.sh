#!/bin/bash

#Q2.2_salary_scale_table.sh
#Author: Ian Molyneaux
#Date: 28/04/2025
#Description: Generate a salary scale based on user input

#User input Starting salary
echo "Enter starting salary:"
read starting_salary
echo "Starting Salary: $starting_salary"

#Points on salary scale and salary increment
echo "Enter number of points on salary scale:"
read number_of_points

echo "Enter salary increment:"
read salary_increment

echo "Number of Points: $number_of_points"
echo "Salary Increment: $salary_increment"

#Check if employee is a Manager
echo "Is the employee a manager? (yes/no):"
read is_manager
