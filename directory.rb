def input_students
  # prompt user to enter a name
  puts "Please enter the name of a student (or enter 'done' if you're finished): "
  name = gets.strip

  # return loop if user enters done
  if name.downcase == "done"
    return
  end

  # prompt user to enter cohort and convert user's input into a symbol
  puts "Please enter the cohort of the student: "
  cohort = gets.strip.to_sym

  # create a new student hash and add it to the appropriate cohort
  @students ||= []
  @students << { name: name, cohort: cohort }
  
  # get the total number of students and print message
  total_students = @students.length
  if total_students == 1
    puts "Now we have 1 student."
  else
    puts "Now we have #{total_students} students."
  end
end

def print_header
  puts "The students of my cohort"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  # get the total number of students
  total_students = @students.length

  # print a message indicating the number of students in either singular or pural
  if total_students == 1
    puts "Overall, we have 1 great student."
  else
    puts "Overall, we have #{total_students} great students."
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu