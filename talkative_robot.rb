require 'pry'

puts "Input user's name (first & last)."
user_name = gets.chomp.capitalize

puts "Input user's gender ('M' or 'F')."
user_gender = gets.chomp.capitalize

puts "Input user's age."
user_age = gets.chomp.to_i

puts "Hi #{user_name} who is #{user_age} years old!"
puts "Do you mind if I call you #{user_name.chars.first}?"

puts "You're getting kind of old." if user_age > 50
puts "You're certainly getting up there in age." unless user_age < 50
if user_age > 50
	puts "You are a man of experience!"
else
	puts "You have much to learn grasshopper."
end

case
when user_age < 75
	puts "You'll be 75 in #{75 - user_age} years."
when user_age > 75
	puts "You turned 75 #{user_age - 75} years ago."
when user_age == 75
	puts "You're 75!"
end

if user_age < 18 && user_gender == "M"
	puts "You are a young BOY!"
elsif user_age < 18 && user_gender == "F"
	puts "You are a young GIRL!"
elsif user_age > 90 && user_gender == "M"
	puts "Are you a great-great grandfather?"
elsif user_age > 90 && user_gender == "F"
	puts "Are you a great-great grandmother?"	
end

puts user_age < 23 ? "You're still a young whippersnapper!" : "You're no longer a whippersnapper..."

# if user_age < 0
# 	puts "Since the unborn cannot run this program. Please input your real age."
# elsif user_age < 75
# 	puts "You will be 75 years old in #{75 - user_age} years."
# elsif user_age > 75
# 	puts "You turned 75 years old #{user_age - 75} years ago."
# else
# 	puts "You are 75 years old."
# end

user_name = user_name.upcase!

puts "Hey #{user_name.split(" ")[0]}, where are you going!?"
puts 'Yo "Dude", what\'s up?'

puts "What did you have for breakfast?"
breakfast = gets.chomp.downcase
puts "I love #{breakfast}!!"

puts "What are your plans for this evening?"
evening_plans = gets.chomp.capitalize
puts "#{evening_plans}, huh? I've been meaning to do that."

