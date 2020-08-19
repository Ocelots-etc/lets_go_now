require_relative '../config/environment'
require_relative '../lib/cli_methods.rb'



# puts "HELLO WORLD"

def run
  puts "Hello, welcome to Lets Go Now app!"
  #help
  user_input = ""
  while user_input
    puts "Lets Go"
    user_input = gets.downcase.strip
    case user_input
    when "sign in"
      puts "Please enter your user name:"
      user_name = gets.chomp.downcase
      user = sign_in(user_name)
      puts "Please choose from any of the following options (enter 1 or 2):
      1. Enter a new address
      2. Retrieve your saved addresses"

    when "1"
      puts "Enter address:"
      user_address = gets.chomp.downcase
      begin
        address_instance = enter_address(user, user_address)
      rescue
        puts "Please try again."
      else
        address_instance
      end
      if !address_instance
      puts "Please choose from following options (enter a or b):
      a. Enter a new address
      b. Retrieve your saved addresses"
        next
      end
      # new_address = gets.chomp.downcase
      # user.add_address_for_user(new_address)
      puts "Please choose from any of the following options (enter 3 or 4):
        3. Find the nearest place to go
        4. Find the nearest 3 places to go"

    when "2"
      puts "These are your saved addresses:"
      user.all_addresses_for_user
      puts "Please enter an address:"
      user_address = gets.chomp.downcase
      address_instance = enter_address(user, user_address)
      if !address_instance
      puts "Please choose from any of the following options (enter 1 or 2):
      1. Enter a new address
      2. Retrieve your saved addresses"
        next
      end

      puts Rainbow("Please choose from following options (enter 3 or 4):
        3. Find the nearest place to go
        4. Find the nearest 3 places to go"
