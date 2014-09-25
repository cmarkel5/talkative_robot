require 'pry'

def over_under_50(age)
	if age > 50
		puts "You are a man of experience!"
	else
		puts "You have much to learn grasshopper."
	end
end

def age_differential(age)
	case
	when age < 0
		puts "You're must not exist. Your age differential is NA."
	when age < 75
		puts "You'll be 75 in #{75 - age} years."
	when age > 75
		puts "You turned 75 #{age - 75} years ago."
	else
		puts "You're 75!"
	end
end

def age_based_message
	puts "This is the age based method with no parameter :)"
end

def age_and_gender_assumption(age, gender)
	if age < 18 && gender == "M"
		puts "You are a young BOY!"
	elsif age < 18 && gender == "F"
		puts "You are a young GIRL!"
	elsif age > 90 && gender == "M"
		puts "Are you a great-great grandfather?"
	elsif age > 90 && gender == "F"
		puts "Are you a great-great grandmother?"	
	end
end

def are_you_a_whippersnapper(age)
	puts age < 23 ? "You're still a young whippersnapper!" : "You're no longer a whippersnapper..."
end


user = {}

puts "Input user's name (first & last)."
user[:name] = gets.chomp.capitalize

puts "Input user's gender ('M' or 'F')."
user[:gender] = gets.chomp.capitalize

puts "Input user's age."
user[:age] = gets.chomp.to_i

puts "Hi #{user[:name]} who is #{user[:age]} years old!"
# puts "Do you mind if I call you #{user[:name].chars.first}?"
puts "You're getting kind of old." if user[:age] > 50
puts "You're certainly getting up there in age." unless user[:age] < 50


age_differential(user[:age])
over_under_50(user[:age])
age_and_gender_assumption(user[:age], user[:gender])
are_you_a_whippersnapper(user[:age])
age_based_message

user[:name] = user[:name].upcase!

puts "Hey #{user[:name].split(" ")[0]}, where are you going!?"
puts 'Yo "Dude", what\'s up?'

puts "What did you have for breakfast?"
user[:breakfast] = gets.chomp.downcase
puts "I love #{user[:breakfast]}!!"

puts "What are your plans for this evening?"
user[:evening_plans] = gets.chomp.capitalize
puts "#{user[:evening_plans]}, huh? I've been meaning to do that."


grocery_list = ["eggs", "milk", "bread", "cheese", "goldfish"]
puts "Please go to the grocery store. Here is your list: #{grocery_list}"
random_item = grocery_list.sample
puts "Did you grab the #{random_item}? (Y or N)."
user[:random_item_response] = gets.chomp.capitalize
if user[:random_item_response] == "Y"
	grocery_list.delete(random_item)
end
puts "#{grocery_list}"

puts "Did you remember anything else that you wanted? (Y or N)."
user[:new_item_response] = gets.chomp.capitalize
if user[:new_item_response] == "Y"
	puts "Please tell me what that item is."
	user[:new_item] = gets.chomp.downcase
	grocery_list << user[:new_item]
	puts "#{grocery_list}"
else
	puts "Ok great, I'll just buy everything that's currently on the list."
end


