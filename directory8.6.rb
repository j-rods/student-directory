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

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, country_of_birth: country_of_birth, hobby: hobby, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name, country of birth and hobby info from the user
    puts "Please enter another student name, country of birth and hobby:"
    puts "To skip and finish, just hit return 3 times"
    name = gets.chomp
    country_of_birth = gets.chomp
    hobby = gets.chomp
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
    student_country = students[count][:country_of_birth]
    student_hobby = students[count][:hobby]
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
