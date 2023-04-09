# loads the CSV library into Ruby program
require 'csv'

# initialise an empty list to store the student's data
@students = []

# defines a method to print the interactive menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to selected file"
  puts "4. Load the students from selected file"
  puts "9. Exit"
end

# defines a method to set and display feedback messages
def set_feedback_message(message)
  @feedback_message = "You have successfully #{message}"
  puts @feedback_message
end

# defines a method for the interactive menu
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# defines a method to process following input from user and display feedback message
def process(selection)
  case selection
  when "1"
    input_students
    set_feedback_message("entered the students")
  when "2"
    show_students
    set_feedback_message("displayed the students.")
  when "3"
    save_students
    set_feedback_message("saved the list of students.")
  when "4"
    load_students
    set_feedback_message("loaded all the students from selected file")
  when "9"
    @feedback_message = "You are exiting the program..."
    puts @feedback_message
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

# defines a method to input student's data
def input_students
  loop do
    # prompt user to enter a name
    puts "Please enter the name of a student (or enter 'done' to finish): "
    name = STDIN.gets.chomp
    break if name.downcase == "done"
    if name.strip.empty?
      puts "No name added, please try again."
      next
    end 
    # prompt user to enter cohort and convert user's input into a symbol
    puts "Please enter the cohort of the student: "
    cohort = STDIN.gets.chomp
    if cohort.strip.empty?
      puts "No cohort added, please try again."
      next
    end 
      
    @students << {name:name, cohort: cohort.to_sym}
    puts "Student added: #{name} (#{cohort} cohort)"
  end
end
 
# defines a method to print the summary of students in either singular or plural  
def print_summary
  total_students = @students.length
   # print a message indicating the number of students in either singular or plural
   if total_students == 1
    puts "Overall, we have 1 great student."
  else
    puts "Overall, we have #{total_students} great students."
  end
end

# defines a method to print data from cohort
def print_students_by_cohort
  if @students.any?
    # gets a list of particular cohorts
    cohorts = @students.map {|student| student[:cohort]}
    # prints data from each cohort
    puts "The students of the cohort"
    puts "-------------"
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort:"
      @students.each_with_index do |student, index|
        if student[:cohort] == cohort #{student[:cohort]} cohort)"
          puts "#{index + 1}. #{student[:name]}"  
        end 
      end 
    end 
  else
    puts "No students to show."
  end
end 

# defines method to show the student data
def show_students
  print_students_by_cohort
  print_summary
end  

# defines method to save student data to a file
def save_students
  puts "Please enter the filename to save to: "
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      CSV << [student[:name], student[:cohort]]
    end
  end
end

# defines method to load student data from the file the user enters
def load_students(filename = "students.csv")
  puts "Please enter the filename to load from: "
  filename = gets.chomp
  if File.exist?(filename)
    @students = []
    CSV.foreach(filename) do |row|
        name, cohort = row
        @students << {name: name, cohort: cohort.to_sym}
    end
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

# defines method to try to load student data from file and csv file is in default
def try_load_students
  filename = ARGV.first # first argument from the command line or students.csv# check filename
  if filename && File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Please enter the filename to load from: "
    filename = gets.chomp
    if File.exist?(filename)
      load_students(filename)
      #puts "Loaded #{@students_count} from #{filename}" 
    else 
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end 
  end
end


interactive_menu
try_load_students

