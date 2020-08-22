require_relative '../config/development'
require_relative '../lib/cli_methods.rb'

def run
  puts "Hi, welcome to Lets Go Now app!"

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
      puts "Please choose from following options (enter 1 or 2):
      1. Enter a new address
      2. Find the nearest place to go"
        next
      end

      puts "Please choose from any of the following options (enter 3 or 4):
        3. Find the nearest 3 places to go
        4. Description of #{nearest_place_to_go.name}"

      when "3"
        puts "Please wait while I find your nearest place to go..."
        distance = address_instance.distance_to_nearest_place_to_go
        nearest_place_to_go = address_instance.find_place_to_go(distance)
        puts "Your nearest place to go is: #{nearest_place_to_go.name} (#{distance.round(10)} miles)."
        puts "Please choose from the next following options (enter 5 or 6):
        5. Description of #{nearest_place_to_go.name}
        6. Weather at #{nearest_place_to_go.name}"

      when "4"
        puts "Please wait while I find your nearest place to go...
          "
        distance = address_instance.distance_to_nearest_place_to_go
        puts "This is your nearest place to go: #{nearest_place_to_go.name}"

      when "sign up"
        sign_up
      when "exit"
        exit
        break
      else
        puts "Sorry, I don't understand. Please try again."
        help
      end
    end
  end

  run
