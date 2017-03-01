@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      #input the students
      input_students
    when "2"
      #show the students
      show_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array

  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print_students_list

    @students.each_with_index{ |student, index|
    name_filter = student[:name][0]
    name_length = student[:name].length
    student_name_and_details = "#{index + 1}. #{name_filter}: #{student[:name]} (#{student[:cohort]} cohort)"
 
    puts student_name_and_details if name_filter == "D" && name_length <= 12 
  }  
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# starts program with menu
interactive_menu