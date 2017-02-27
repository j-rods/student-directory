def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students)
    students.each_with_index{ |student, index|
    name_filter = student[:name][0]
    name_length = student[:name].length
    student_name_and_details = "#{index + 1}. #{name_filter}: #{student[:name]} (#{student[:cohort]} cohort)"
 
    puts student_name_and_details if name_filter == "D" && name_length <= 12 
  }  
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
