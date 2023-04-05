# create an empty hash to store the students grouped by cohort
students_grouped_by_cohort = {}

# use a loop until the user enters 'done'
loop do
  # prompt user to enter a name
  print "Please enter the name of a student (or enter 'done' if you're finished): "
  name = gets.chomp

  # break loop if user enters done
  break if name.downcase == "done"

  # prompt user to enter cohort and convert user's input into a symbol
  print "Please enter the cohort of the student: "
  cohort = gets.chomp.downcase.to_sym

  # loop until user enters valid cohort else print an error message
  until [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december].include?(cohort)
    print "You have entered an invalid. Please enter a valid cohort: "
    cohort = gets.chomp.downcase.to_sym
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
end

# get a list of all existing cohorts
cohorts = students_grouped_by_cohort.keys

# prompt the user to select a cohort and display the names of the students in that cohort
# iterate over the list of cohorts and ask user to select a cohort
puts "Please enter a cohort you would like to see (#{cohorts.join(", ")}) or enter 'exit' to quit:"
cohort_to_display = gets.chomp.downcase.to_sym

# loop until user enters 'exit'
until cohort_to_display == :exit
  # check if the cohort entered exists and print the names of the students in that cohort
  if students_grouped_by_cohort.key?(cohort_to_display)
    puts "#{cohort_to_display.capitalize} Cohort:".center(50)
    students_grouped_by_cohort[cohort_to_display].each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]}"
    end
  else
    puts "You have entered an invalid cohort. Please try again."
  end

  # ask user to enter another cohort or enter 'exit' to quit
  puts "Please enter another cohort you would like to view (#{cohorts.join(", ")}) or enter 'exit' to quit:"
  cohort_to_display = gets.chomp.downcase.to_sym
end

puts "Goodbye!"








