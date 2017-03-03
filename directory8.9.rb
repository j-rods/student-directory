def cohorts
  cohort = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
end
@default_input = "No data available"

def input_students
  puts "Villains Academy Student Directory"
  puts "Please enter a student name:"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp

  puts "Please add the student's country of birth:"
  puts "To skip, just hit return"
  country_of_birth = gets.chomp

  puts "Please add the student's hobby:"
  puts "To skip, just hit return"
  hobby = gets.chomp

  puts "Please add the student's cohort (i.e March):"
  puts "To skip, just hit return"
  cohort = gets.chomp
  cohort.to_sym

  while !name.empty? do
    puts "Are these details correct?" 
    puts "Name: #{name},"
    puts "Country of birth: #{if country_of_birth.empty? then (country_of_birth = @default_input) else country_of_birth end}," 
    puts "Hobby: #{if hobby.empty? then (hobby = @default_input) else hobby end},"
    puts "Cohort: #{if cohort.empty? then (cohort = @default_input) else cohort end}."
    
    puts "Please make sure details are correct or student may not be listed, Type Y/N:"
    confirmation = gets.chomp

      if (confirmation == "Y".upcase || confirmation == "Y".downcase) && (cohorts.include? cohort)   
        # add the student hash to the array     
        students << {name: name, country_of_birth: country_of_birth, hobby: hobby, cohort: cohort}
        # student_number will select singular on first student input and plural on 2 or more student inputs
        student_number = if students.count >= 2 then "students" else "student" end
        puts "Now we have #{students.count} #{student_number}"
      else
        puts "Input error, please try again."
        exit(0)
      end
    # get another name, country of birth, hobby and cohort info from the user
    puts "Please enter another student name, country of birth, hobby and cohort:"
    puts "To skip the input form and finish, please hit return 4 times, till end"
    name = gets.chomp
    country_of_birth = gets.chomp
    hobby = gets.chomp
    cohort = gets.chomp
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
    student_country = students[count][:country_of_birth]
    student_hobby = students[count][:hobby]
    student_cohort = students[count][:cohort]
    #prints student data if the student starts by the letter D and the length is equal or less than 12 characters long
    if (name_filter == "D") && (name_length <= 12) 
      puts "#{count + 1} #{student_name}, (#{student_cohort} cohort), Country of birth: #{student_country}, Hobby: #{student_hobby}".center(80)    
    end
    count += 1
  end
  # prints the list of students that meet all the set conditions
  # prints the list of students with a list number, starting by 1
  students
end

def print_footer(students)
  # student_number will select singular on first student input and plural on 2 or more student inputs
  student_number = if students.count >= 2 then "students" else "student" end
  puts "Overall, we have #{students.count} great #{student_number}"
end

# students is a variable that stores input_students, which stores any name given by user
students = input_students
# prints function print_header
print_header

# calls function print on students
print(students)

# calls function print_footer on students and prints the count of students
print_footer(students)
