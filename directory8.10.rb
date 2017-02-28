# To run program, type in command: ruby directory8.10.rb <studentname>
def cohorts
  cohort = ["January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"]
end

def input_students
  puts "Villains Academy Student Directory"
  # gets the first argument on program start
  name = ARGV.first
  puts "Student 1: #{name}"
  # create an empty array
  students = []

  puts "Please add the student's year of birth (i.e 1980):"
  puts "To skip, just hit return"
  birth_year = $stdin.gets.chomp

  puts "Please add the student's hobby:"
  puts "To skip, just hit return"
  hobby = $stdin.gets.chomp

  puts "Please add the student's cohort (i.e March):"
  puts "To skip, just hit return"
  cohort = $stdin.gets.chomp
  cohort.to_sym

  while !name.empty? do
    puts "Are these details correct?" 
    puts "Name: #{name},"
    puts "Birth Year: #{if birth_year.empty? then (birth_year = "no data") else birth_year end}," 
    puts "Hobby: #{if hobby.empty? then (hobby = "no data") else hobby end},"
    puts "Cohort: #{if cohort.empty? then (cohort = "no data") else cohort end}."
    
    puts "Please make sure details are correct or student may not be listed, Type Y/N:"
    confirmation = $stdin.gets.chomp

      if (confirmation == "Y".upcase || confirmation == "Y".downcase) && (cohorts.include? cohort)   
        # add the student hash to the array     
        students << {name: name, birth_year: birth_year, hobby: hobby, cohort: cohort}
        # student_number will select singular on first student input and plural on 2 or more student inputs
        student_number = if students.count >= 2 then "students" else "student" end
        puts "Now we have #{students.count} #{student_number}"
        # get another name from the user
      else
        puts "Input error, please try again."
        exit(0)
      end
    puts "Please enter another student name, year of birth (i.e 1980), hobby and cohort:"
    puts "To skip the input form and finish, please hit return 4 times, till end"
    name = $stdin.gets.chomp
    birth_year = $stdin.gets.chomp
    hobby = $stdin.gets.chomp
    cohort = $stdin.gets.chomp
    cohort.to_sym
  end
  # return the hash of students sorted by cohort
  students.sort_by! { |x| x[:cohort].downcase }
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end

def print(students)
  count = 0
  while (count < students.length)
    name_filter = students[count][:name][0]
    name_length = students[count][:name].length
    student_name = students[count][:name]   
    student_birth_year = students[count][:birth_year]
    student_hobby = students[count][:hobby]
    student_cohort = students[count][:cohort]

    student_data = "#{count + 1} #{student_name}, (#{student_cohort} cohort), Birth year: #{student_birth_year}, Hobby: #{student_hobby}"
    #prints student data if the student starts by the letter D and the length is equal or less than 12 characters long
    puts "#{student_data}".center(80) if (name_filter == "D" && name_length <= 12)
    count += 1
  end
  # prints the list of students that meet all the set conditions
  # prints the list of students with a list number, starting by 1
  students
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# students is a variable that stores input_students, which stores any name given by user
students = input_students
# prints function print_header
print_header

# calls function print on students
print(students)

# calls function print_footer on students and prints the count of students
print_footer(students)
