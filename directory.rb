# create an empty list of students and name
students = []
name = ""

# use while loop until user enters 'done'
while name.downcase != "done"
  # prompt user to enter name 
  puts "Please enter the name of a student (or enter 'done' if you're finished):"
  name = gets.chomp

  # break loop if user enters done
  if name.downcase == "done"
    break
  end

  # prompt user to enter cohort and convert user's input into a symbol
  puts "Please enter the cohort of the student:"
  cohort = gets.chomp.to_sym

  # define the valid cohorts in a list of symbols 
  valid_cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

  #  program will loop until user enters valid cohort else it will print an error message
  until valid_cohorts.include?(cohort)
    puts "Invalid cohort entered. Please enter a valid cohort:"
    cohort = gets.chomp.to_sym
  end

  # create a hash for the students and add it to the list
  student = {
    name: name.empty? ? "Unknown" : name,
    cohort: cohort.empty? ? :november : cohort.to_sym
  }

  students << student
end

# go through the student list and print a student's name and cohort
students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
end



