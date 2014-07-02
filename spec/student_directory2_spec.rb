require 'student_directory2'

describe  "Student Directory TDD Project" do

		let(:student) {{name: "Eddie", cohort: :June, hobby: "snowboarding"}}

		it "prints the header using p" do
			expect(self).to receive(:p).with("The students of Makers Academy\n=======================================")
			print_header
		end

	 	it "prints the footer using p" do
	 		expect(self).to receive(:p).with("Overall, we have #{student_list.length} great students")
	 		print_footer
		end

		it 'displays the interactive menu' do
			expect(self).to receive(:print).with("Welcome to the Test-Driven Student Directory\n1. Enter student info\n2. Show the students\n3. Save students to students.csv\n4. Load students from students.csv\n9. Exit")
			display_menu
		end

	context "gets data for the directory by" do
		it "asking student for name" do
			expect(self).to receive(:p).with("What's the students name?")
			student_name
		end

		it "accepting input for name" do
			name = "Alex\n"
			expect(self).to receive(:gets).and_return(name)
			expect(input_name).to eq 'Alex'
		end

		it "asking student for their cohort" do
			expect(self).to receive(:p).with("What's your cohort?")
			ask_for_cohort
		end

		it 'accepting input for cohort' do
			month = "June\n"
			expect(self).to receive(:gets).and_return(month)
			expect(input_month).to eq 'June'
		end

		it "asking for the student's favourite hobby" do
			expect(self).to receive(:p).with("Please enter the student's favourite hobby")
			ask_for_hobby
		end

		it "accepting input for hobby" do
			hobby = "Coding\n"
			expect(self).to receive(:gets).and_return(hobby)
			expect(input_hobby).to eq "Coding"
		end

		it "if name is left empty, direct to interactive menu" do
		end
	
	end

	context "save student data by" do

		it "adding information to student_list as a hash" do
			name = "Alex"
			cohort = "June"
			hobby = "Coding"
			expect(create_student(name, cohort, hobby)).to eq({name: "Alex", cohort: :June, hobby: :Coding})
			Alex = create_student(name, cohort, hobby)
			add_student(Alex)
			expect(student_list).to eq [Alex]
		end

		it "converting student data to csv" do
			expect(student_to_csv(student)).to eq ['Eddie', :June, 'snowboarding']
		end

		it "storing student data as a csv file" do
			student_list = [student]
			csv = double
			expect(csv).to receive(:<<).with(student_to_csv(student))
			expect(CSV).to receive(:open).with('./students.csv', 'w').and_yield(csv)
			save_students(student_list)
		end
	end


	context "Loads student data by" do

		it "opening a csv file" do
			csv = 'Eddie', :June, 'snowboarding'
			expect(CSV).to receive(:foreach).with('./students.csv').and_yield(csv)
			load_student_list
		end
	end

	context 'student_cohort' do
		it 'knows that June is a month' do
			expect(month_exists?('June')).to be true
		end

		it 'knows that Bloom is not a month' do
			expect(month_exists?('Bloom')).not_to be true
		end

		it 'will not allow us to input the wrong month' do
			month = "blah\n"
			allow(self).to receive(:gets).and_return(month)
			expect(input_month).to eq 'You entered the wrong month name!'
		end
	end

	context 'Print the student info' do

		it "as a list containing only the hash values and the student number" do
			name = "Alex"
			cohort = "June"
			hobby = "Coding"
			alex = create_student(name, cohort, hobby)
			student_list << alex
			student_list.each_with_index {|student, index|
			expect(self).to receive(:p).with("#{index+1}. Alex (June cohort), Coding")}
		print_students
		end

	end
end

#students.select {|student| "#{student[:name]}".start_with?("A")}



