def input_students
  puts "Villains Academy Student Directory"
  puts "Please enter a student name:"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp

  puts "Please add the student's year of birth (i.e 1980):"
  puts "To skip, just hit return"
  birth_year = gets.chomp

  puts "Please add the student's hobby:"
  puts "To skip, just hit return"
  hobby = gets.chomp

  puts "Please add the student's cohort (March or November):"
  puts "To skip, just hit return"
  cohort = gets.chomp
  cohort.to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array     
      students << {name: name, birth_year: birth_year, hobby: hobby, cohort: cohort} 
      puts "Now we have #{students.count} students"
      puts "Make sure that the #{cohort[cohort]} cohort has been typed correctly or may not be listed..."
      # get another name from the user
      puts "Please enter another student name, year of birth (i.e 1980), hobby and cohort:"
      puts "To skip the input form and finish, please hit return 4 times, till end"
      name = gets.chomp
      birth_year = gets.chomp
      hobby = gets.chomp
      cohort = gets.chomp
      cohort.to_sym
  end
  # return the array of students
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
    student_cohort = students[count][:cohort]
    student_birth_year = students[count][:birth_year]
    student_hobby = students[count][:hobby]

    
    puts "#{count + 1} #{student_name}, (#{student_cohort} cohort), #{student_birth_year}, #{student_hobby}".center(80) if
    (name_filter == "D" && name_length <= 12) && (student_cohort == "March" || student_cohort == "November")
    count += 1
  end
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
