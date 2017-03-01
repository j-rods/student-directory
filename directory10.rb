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

def cohorts
  cohort = ["January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"]
end

def input_students
  puts "Villains Academy Student Directory"
  puts "Please enter a student name:"
  # get the first name
  name = gets.chomp

  puts "Please add the student's year of birth (i.e 1980):"
  puts "To skip, just hit return"
  birth_year = gets.chomp

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
    puts "Birth Year: #{if birth_year.empty? then (birth_year = "no data") else birth_year end}," 
    puts "Hobby: #{if hobby.empty? then (hobby = "no data") else hobby end},"
    puts "Cohort: #{if cohort.empty? then (cohort = "no data") else cohort end}."
    
    puts "Please make sure details are correct or student may not be listed, Type Y/N:"
    confirmation = gets.chomp

      if (confirmation == "Y".upcase || confirmation == "Y".downcase) && (cohorts.include? cohort)   
        # add the student hash to the array     
        @students << {name: name, birth_year: birth_year, hobby: hobby, cohort: cohort}
        puts "Now we have #{@students.count} students"
        # get another name from the user
      else
        puts "Input error, please try again."
        exit(0)
      end
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

def print_students_list
# if list contains 1 or more students
    # print list
  # else
    # puts "Student list is empty."
  if @students.count >= 1  
    count = 0
    while (count < @students.length)
      name_filter = @students[count][:name][0]
      name_length = @students[count][:name].length
      student_name = @students[count][:name]
      student_cohort = @students[count][:cohort]
      student_birth_year = @students[count][:birth_year]
      student_hobby = @students[count][:hobby]

      
      puts "#{count + 1} #{student_name}, #{student_cohort} cohort), Birth year: #{student_birth_year}, Hobby: #{student_hobby}".center(80) if
      (name_filter == "D" && name_length <= 12)
      count += 1
    end
  else
    puts "Student list is empty."
  end
end

def print_footer
  if @students.count >= 1  
    puts "Overall, we have #{@students.count} great students"
  end
end

# starts program by with menu
interactive_menu

