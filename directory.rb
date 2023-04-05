def input_students(students_grouped_by_cohort)
  # prompt user to enter a name
  print "Please enter the name of a student (or enter 'done' if you're finished): "
  name = gets.strip

  # break loop if user enters done
  return if name.downcase == "done"

  # prompt user to enter cohort and convert user's input into a symbol
  print "Please enter the cohort of the student: "
  cohort = gets.strip.downcase.to_sym

  # loop until user enters valid cohort else print an error message
  until [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december].include?(cohort)
    print "You have entered an invalid. Please enter a valid cohort: "
    cohort = gets.strip.downcase.to_sym
  end

  # create a hash for the student and add it to the list
  student = {
    name: name.empty? ? "Unknown" : name,
    cohort: cohort.empty? ? :november : cohort
  }

  # group the students by their cohorts
  if students_grouped_by_cohort[cohort].nil?
    students_grouped_by_cohort[cohort] = [student]
  else
    students_grouped_by_cohort[cohort] << student
  end

  # print a message indicating the number of students
  total_students = students_grouped_by_cohort.values.flatten.length
  if total_students == 1
    puts "Now we have 1 student."
  else
    puts "Now we have #{total_students} students."
  end
end

def print_header()
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students(students_grouped_by_cohort)
  students_grouped_by_cohort.each do |cohort, students|
    puts "#{cohort.capitalize} Cohort:".center(20)
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]}"
    end
    puts ""
  end
end

def print_footer(students_grouped_by_cohort)
  # get the total number of students
  total_students = students_grouped_by_cohort.values.flatten.length

  # print a message indicating the number of students
  if total_students == 1
    puts "Overall, we have 1 great student."
  else
    puts "Overall, we have #{total_students} great students."
  end
end

def interactive_menu
  students_grouped_by_cohort = {}
  loop do
    # print menu options
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    # get user input
    selection = gets.chomp

    # perform action based on user input
    case selection
    when "1"
      input_students(students_grouped_by_cohort)
    when "2"
      print_header
      print_students(students_grouped_by_cohort)
      print_footer(students_grouped_by_cohort)
    when "9"
      exit
    else
      puts "I don't know what you mean. Please try again."
    end
  end
end

interactive_menu









