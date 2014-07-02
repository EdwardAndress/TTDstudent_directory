require 'student_directory2'

describe  "Student Directory TDD Project" do

		it "prints the header using p" do
			expect(self).to receive(:p).with("The students of Makers Academy\n=======================================")
			print_header
		end

	 	it "prints the footer using p" do
	 		expect(self).to receive(:p).with("Overall, we have #{student_list.length} great students")
	 		print_footer
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
	
	end

	context "save student data by" do

		it "adding information to student_list as a hash" do
			name = "Alex"
			cohort = "June"
			hobby = "Coding"
			expect(create_student(name, cohort, hobby)).to eq({name: "Alex", cohort: :June, hobby: :Coding})
			alex = create_student(name, cohort, hobby)
			add_student(alex)
			expect(student_list).to eq [alex]
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

		it 'for students whose names begin with the letter A' do
			student_list << [{name: "Alex", cohort: "June", hobby: "Coding"}, {name: "Dave", cohort: "June", hobby: "Coding"}]
			expect(self).to receive(:p).with(student_list)
			expect(select_students_starting_with_A).to eq("Alex, June, Coding")
			select_students_starting_with_A		
		end

	end
end

#students.select {|student| "#{student[:name]}".start_with?("A")}



