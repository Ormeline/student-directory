def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do 
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp 
    end 
    #return the array of students
    students
end 

=begin
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
=end

  # and then print them
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end 

 #use if statement to check if student's name starts with a particular letter
  def print_students_by_letter(students, letter)
    students.each_with_index do |student, index|
        if student[:name].start_with?(letter)
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
  end 
end 

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end 
#nothing will happen until you call the methods
students = input_students
print_header
print_students_by_letter(students, "A")
print_footer(students)

