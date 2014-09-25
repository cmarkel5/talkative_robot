require 'pry'

def over_under_50(user)
	if user[:age] > 50
		puts "You are a man of experience!"
	else
		puts "You have much to learn grasshopper."
	end
end

def age_differential(user)
	age = user[:age]
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

def age_and_gender_assumption(user)
	age = user[:age]
	gender = user[:gender]
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

def are_you_a_whippersnapper(user)
	puts user[:age] < 23 ? "You're still a young whippersnapper!" : "You're no longer a whippersnapper..."
end

def old?(user)
	user[:age] > 50
end

def get_user_info
	user = {}

	puts "Input user's name (first & last)."
	user[:name] = gets.chomp.capitalize

	puts "Input user's age."
	user[:age] = gets.chomp.to_i

	puts "Input user's gender ('M' or 'F')."
	user[:gender] = gets.chomp.capitalize

	user
end

def greeting(user)
	puts "Hi #{user[:name]} who is #{user[:age]} years old!"
	puts old?(user) ? 'You\'re kind of old.' : 'You\'re not "old" yet'
end

the_user = get_user_info
greeting(the_user)
age_differential(the_user)
over_under_50(the_user)
age_and_gender_assumption(the_user)
are_you_a_whippersnapper(the_user)

def grocery_shopping
	grocery_list = ["eggs", "milk", "bread", "cheese", "goldfish"]
	random_item = grocery_list.sample
	puts "Did you grab the #{random_item}? (Y or N)."
	random_item_response = gets.chomp.capitalize
	if random_item_response == "Y"
		grocery_list.delete(random_item)
	end
	puts grocery_list.join(", ")

	puts "Did you remember anything else that you wanted? (Y or N)."
	new_item_response = gets.chomp.capitalize
	if new_item_response == "Y"
		puts "Please tell me what that item is."
		new_item = gets.chomp.downcase
		grocery_list << new_item
		puts grocery_list.join(", ")
	else
		puts "Ok great, I'll just buy everything that's currently on the list."
	end

end

grocery_shopping


author = {name: "Chris Markel", age: 27, gender: "M"}
people = [the_user, author]
author = people.reject { |person| person[:name] != "Chris Markel" }.first

def select_by_name(list_of_users, name)
	list_of_users.select { |person| person[:name] == name }.first
end

author = select_by_name(people, author[:name])


# puts "Reading grocery list from file grocery.txt."

# grocery_list = IO.read("grocery.txt").chomp.split(", ")
# grocery_list.map! { |item| item.downcase }
# IO.write("new_grocery.txt", grocery_list)

# grocery_list = ["eggs", "milk", "bread", "cheese", "goldfish"]
# grocery_list.each_index { |i| puts "Item #{i+1} -- #{grocery_list[i]}"}
