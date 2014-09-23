require 'pry'

puts "Input user's name (first & last)"
user_name = gets.chomp.capitalize

puts "Input user's age"
user_age = gets.chomp.to_i

puts "Hi #{user_name} who is #{user_age} years old!"
puts "Do you mind if I call you #{user_name.chars.first}?"

if user_age < 0
	puts "Since the unborn cannot run this program. Please input your real age."
elsif user_age < 75
	puts "You will be 75 years old in #{75 - user_age} years."
elsif user_age > 75
	puts "You turned 75 years old #{user_age - 75} years ago."
else
	puts "You are 75 years old."
end

user_name = user_name.upcase!

puts "Hey #{user_name.split(" ")[0]}, where are you going!?"
puts 'Yo "Dude", what\'s up?'

puts "What did you have for breakfast?"
breakfast = gets.chomp.downcase
puts "I love #{breakfast}"

puts "What are your plans for this evening?"
evening_plans = gets.chomp.capitalize
puts "#{evening_plans}, huh? I've been meaning to do that."

