@students = []
STUDENT_DATABASE = "students.csv"

# define method student_list that takes 2 arguments, name and cohort
# this method can be called when the hash needs to be populated or called. 
def student_list(name, cohort = :november)
  @students << {name: name, cohort: :november}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "Menu:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to the student database"
  puts "4. Load the list from the student database"
  puts "5. Exit"
end

def process(selection)
  case selection
    when "1"
      puts "Option 1 Selected"
      input_students #input the students  
    when "2"
      puts "Option 2 Selected"
      show_student_list #show the students
    when "3"
      puts "Option 3 Selected"
      save_to_file #saves students
    when "4"
      puts "Option 4 Selected"
      # load_from_file #loads list of students
      select_file_to_load
    when "5"
      puts "Exiting database..."
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end
# if user selects option 3
# define a method that asks for a file name to save file 
def save_to_file
  # ask user to save to current file or save to new file
  puts "Select a save option: "
  puts "1. Save to current file"
  puts "2. Save as new file."
  save_selection = $stdin.gets.chomp   
    if save_selection.include? "1" 
      save_to_current_file
    elsif save_selection.include? "2"
      create_new_file        
    else
      puts "Error, please try again."
      save_to_file 
    end
end

# creates new file by user input 
# --> I am using students.csv as name file <---
def create_new_file
  puts "Type the name of the file to be created:"  
  temp_file = $stdin.gets.chomp

  new_file = File.new(temp_file, "w+")
    if temp_file == STUDENT_DATABASE
      puts "File saved as #{STUDENT_DATABASE}"
      save_to_current_file
    else
      File.rename(new_file, STUDENT_DATABASE)
    end
end

# asks for a file name of load file
# if user selects option 4
def select_file_to_load
  # ask user to input the name of the file to be loaded
  puts "Type the filename to be loaded:"
  filename = $stdin.gets.chomp
    if filename == "students.csv"
      load_from_file 
    else 
      puts "This file is not in our database, please try again."
      select_file_to_load
    end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    student_list(name, cohort = cohort).uniq!
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_student_list
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print_students_list
    @students.each_with_index{ |student, index|
    name_filter = student[:name][0]
    name_length = student[:name].length
    if (name_filter == "D") && (name_length <= 12)
      puts "#{index + 1}. #{name_filter}: #{student[:name]} (#{student[:cohort]} cohort)" 
    end  
    }  
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end
# this method saves student lists to file
def save_to_current_file
  # open the file for writing
  file = File.open(STUDENT_DATABASE, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end
# this method takes 1 argument and populates it with filename.
def load_from_file(filename = STUDENT_DATABASE)
  file = File.open(filename, "r") # the filename is loaded
  puts "Filename: #{filename} loaded."
  file.readlines.each do |line| # 
    name, cohort = line.chomp.split(", ")
    student_list(name, cohort = cohort.to_sym).uniq!
  end
  file.close
end
# this method loads file with first argument given at the command line
def load_file_with_argument
  filename = ARGV.first 
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quits the program
  end  
end

# starts program with menu
interactive_menu