def input_students
  puts "Please enter the names of the students: "
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
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  # if list contains 1 or more students
    # print list
  # else
    # puts "Student list is empty."
  if students.count >= 1  
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"

    end
  else
    puts "Student list is empty."
  end

end

def print_footer(students)
    # if student count contains 1 or more students
    # puts message
      # else
    # this will not print
  if students.count >= 1  
    puts "Overall, we have #{students.count} great students"
  end
end


students = input_students
print_header
print(students)
print_footer(students)