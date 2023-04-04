students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
  ]

  # and then print them
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end 

 #use if statement to print students' names with shorter than 12 letters.
  def print_students_name_shorter_than_12(students)
    puts "The students with less than 12 characters in their name are:"
    students.each_with_index do |student, index|
        if student[:name].length < 12
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
  end 
end 

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end 

# call the methods
print_header
print_students_name_shorter_than_12(students)
print_footer(students)

