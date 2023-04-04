# initialise a list of students' names
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

  # define a method to print the header of student list
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end 

 # define a method to print the list of students' names and use the while loop
  def print_students(students)
    x = 0
    while x < students.length
        puts "#{x+1}. #{students[x][:name]} (#{students[x][:cohort]} cohort)"
        x += 1
  end 
end 

# define a method to print the footer of students' name list
def print_footer(names)
puts "Overall, we have #{names.count} great students"
end 

# call the methods to print the list of students' names
print_header
print_footer(students)
print_students(students)

