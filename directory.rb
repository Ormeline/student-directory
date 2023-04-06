@students = []

def input_students
  # prompt user to enter a name
  puts "Please enter the name of a student (or enter 'done' if you're finished): "
  name = STDIN.gets.chomp

  # return loop if user enters done
  if name.downcase == "done"
    return
  end
  # prompt user to enter cohort and convert user's input into a symbol
  puts "Please enter the cohort of the student: "
  cohort = STDIN.gets.chomp.to_sym

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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the students from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu