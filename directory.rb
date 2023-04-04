# initialise a list of students' names
students = [
  {name: "Dr. Hannibal Lecter", cohort: :November, nationality: "British", age: 21, height_cm: 160},
  {name: "Darth Vader", cohort: :November, nationality: "German", age: 25, height_cm: 175}, 
  {name: "Nurse Ratched", cohort: :November, nationality: "South African", age: 23, height_cm: 159},
  {name: "Michael Corleone", cohort: :November, nationality: "Jamaican", age: 24, height_cm: 149},
  {name: "Alex DeLarge", cohort: :November, nationality: "French", age: 25, height_cm: 161},
  {name: "The Wicked Witch of the West", cohort: :November, nationality: "British", age: 23, height_cm: 151},
  {name: "Terminator", cohort: :November, nationality: "French", age: 25, height_cm: 148},
  {name: "Freddy Krueger", cohort: :November, nationality: "Congolese", age: 24, height_cm: 164},
  {name: "The Joker", cohort: :November, nationality: "Nigerian", age: 23, height_cm: 174},
  {name: "Joffrey Baratheon", cohort: :November, nationality: "British", age: 26, height_cm: 168},
  {name: "Norman Bates", cohort: :November, nationality: "British", age: 24, height_cm: 178}
]

# define a method to print the header of student list
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end 

# define a method to print the list of students' names and use the while loop
def print_students(students)
  x = 0
  while x < students.length
    puts "#{x+1}. #{students[x][:name].center(25)} (#{students[x][:cohort]} cohort)  Nationality: #{students[x][:nationality].center(12)} Age: #{students[x][:age].to_s.center(4)} Height: #{students[x][:height_cm].to_s.center(4)}"
    x += 1
  end 
end 

# define a method to print the footer of students' name list
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end 

# call the methods to print the list of students' names
print_header
print_footer(students)
print_students(students)

