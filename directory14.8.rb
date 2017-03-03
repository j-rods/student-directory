# prints all sourcecode from file to console
IO.foreach(__FILE__) {|x| print " ", x }

@student_name = []

def input_students_name
  puts "Please enter a student name:"
  puts "to skip, just hit return"
  name = gets.chomp
  while !name.empty? do
    @student_name << {name: name}    
    # name = gets.chomp
    name = gets.chomp
  end
end

def print_students
  count = 0
  while count != @student_name.length
    puts "Student #{count + 1}: #{@student_name[count][:name]} "
    count += 1
  end
end

input_students_name
