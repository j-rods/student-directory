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
    puts ("#{index + 1}. #{student[:name][0]}: #{student[:name]} (#{student[:cohort]} cohort)") if (student[:name][0] == "D") 
    
  }  

end

# print names that start with a specific letter, D
# if student first letter starts with D
  #print student name
# else
  #dont print
# end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
