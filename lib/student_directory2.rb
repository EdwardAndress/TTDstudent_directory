require 'date'

def print_header
	 p "The students of Makers Academy\n======================================="
end

def display_menu
	print "Welcome to the Test-Driven Student Directory\n1. Enter student info\n2. Show the students\n3. Save students to students.csv\n4. Load students from students.csv\n9. Exit"
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

def create_student(name, cohort, hobby)
	student = {name: name, cohort: cohort.to_sym, hobby: hobby.to_sym}
end

def add_student(student)
	student_list << student
end

def print_students
	student_list.each_with_index do |student, index|
	p "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), #{student[:hobby]}"
	end
end

require 'csv'

def student_to_csv(student)
	student.values
end

def save_students(student_list)
	CSV.open("./students.csv", "w") do |csv|
		student_list.each do |student|
			csv << student_to_csv(student)
		end
	end
end

def load_student_list
	CSV.foreach('./students.csv') do |row|
		loaded_student = create_student(row[0], row[1], row[2])
		add_student(loaded_student)
	end		
end



























