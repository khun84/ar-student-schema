# app/interface.rb
require_relative '../db/config'
require_relative './models/student'
require 'erb'

def user_index
  print "Details\n"
  print "-"*20
  justify = "First Name".length + 4
  index = 1
  Student.all.each do |s|
    print "No. ".ljust(justify) + "#{index+1}\n"
    print "First Name".ljust(justify) + "#{s.first_name}\n"
    print "Last Name".ljust(justify) + "#{s.last_name}\n"
    print "Gender".ljust(justify) + "#{s.gender}\n"
    print "Phone".ljust(justify) + "#{s.phone}\n"
    print "Email".ljust(justify) + "#{s.email}\n"
    print "\n"
    index+=1
  end
end

def new_user_prompt
  # `params` is a hash that contains all user inputs
  # this way you don't need to have multiple variables
  params = {}
  puts "Student's first name?"
  print_prompt
  params[:first_name] = gets.chomp

  puts "Student's last_name?"
  print_prompt
  params[:last_name] = gets.chomp

  puts "Student's gender?"
  print_prompt
  params[:gender] = gets.chomp

  puts "Student's email?"
  print_prompt
  params[:email] = gets.chomp

  puts "Student's phone?"
  print_prompt
  params[:phone] = gets.chomp

  puts "Student's birthday? (yyyymmdd)"
  print_prompt
  temp = gets.chomp
  params[:birthday] = Date.new(temp[(0..3)].to_i, temp[(4..5)].to_i,temp[(6..7)].to_i)

  return params
end

def user_create
  loop do
    params = new_user_prompt

    # BONUS: can you think of a way to do this better?
    student = Student.new(params)
    if student.save
      puts "User saved!"
      break
    else
      puts "There was an error in your input. Please check your inputs and try again"
      # http://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors
      p student.errors
    end
  end
end

def print_menu
  # BONUS: refactor to sync menu options with case statements
  puts <<~STR
    Welcome! Please pick an option
    1. List all users
    2. Create a new user
    3. Exit
  STR
end

def print_prompt
  puts ">> "
end

# BONUS: clear terminal upon pick option
loop do
  print_menu
  # BONUS: refactor repetitive prompt
  print_prompt
  input = gets.chomp
  system 'clear'
  case input
    when "1"
      puts "=== All users ===\n"
      user_index
    when "2"
      puts "=== Creating a new user ===\n"
      user_create
    when "3"
      puts "Goodbye!"
      break
    else
      puts "Invalid option!"
  end
end


