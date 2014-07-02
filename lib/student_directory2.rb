require 'date'

def print_header
	 p "The students of Makers Academy\n======================================="
end

def print_footer
	p "Overall, we have #{student_list.length} great students"
end

def student_name
	 p "What's the students name?" 
end

def input_name
	name = gets.chomp
end

def ask_for_cohort
	p "What's your cohort?"
end

def input_month
	month = gets.chomp
	return 'You entered the wrong month name!' unless month_exists?(month)
	month
end

def month_exists?(month)
	Date::MONTHNAMES.include?(month.downcase.capitalize)
end

def ask_for_hobby
	p "Please enter the student's favourite hobby"
end

def input_hobby
	hobby = gets.chomp
end

def student_list
	@students ||= []
end

def student_to_array(name, cohort, hobby)
	student_list << {name: name, cohort: cohort, hobby: hobby}
end

def create_student(name, cohort, hobby)
	{name: name, cohort: cohort.to_sym, hobby: hobby.to_sym}
end

def add_student(student)
	student_list << student
end

def print_students
	student_list.each_with_index do |student, index|
	p "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), #{student[:hobby]}"
	end
end

def select_students_starting_with_A
	starts_with_A = student_list.select {|student| "#{student[:name]}".start_with?("A")}
	starts_with_A.each {|student| puts "#{student[:name]}, #{student[:cohort]}, #{student[:hobby]}"}
end