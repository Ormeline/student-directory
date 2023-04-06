@students = []

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

def print_students_count
  total_students = @students.length
   # print a message indicating the number of students in either singular or plural
   if total_students == 1
    puts "Overall, we have 1 great student."
  else
    puts "Overall, we have #{total_students} great students."
  end
end

def print_header_footer
  if @students.any?
    cohorts = @students.map {|student| student[:cohort]}
    puts "The students of my cohort"
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

def show_students
  print_header_footer
  print_students_count
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

def load_students(filename = "students.csv")
  @students = []
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first || "students.csv" # first argument from the command line or students.csv
  puts "Filename: #{filename}" # check filename
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
