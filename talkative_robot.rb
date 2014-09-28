require 'pry'

def over_under_50(user)
	if user[:age] > 50
		puts "You are a person of experience!"
	else
		puts "You have much to learn grasshopper."
	end
end

def age_differential(user)
	age = user[:age]
	case
	when age < 0
		puts "Based on your entry, you must not exist. Please enter a real age."
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


#GROCERY SHOPPING BEGINS
def create_grocery_list
	grocery_list = ["eggs", "milk", "bread", "cheese", "goldfish"]
	IO.write("grocery.txt", grocery_list.join(", "))
end

def save_grocery_list(file, list)
	IO.write(file, list.join(", "))
end

def show_grocery_list(show_list)
	show_list.each_index { |i| puts "Item #{i+1} -- #{show_list[i]}"}
end

def grocery_shopping
	create_grocery_list

	grocery_list = IO.read("grocery.txt").chomp.split(", ")
	
	puts "I have a list of groceries that I need from the store. The list is below if you could grab these items:"
	show_grocery_list(grocery_list)
	
	random_item = grocery_list.sample
	puts "Wait, we might already have #{random_item}. Do we? (Y or N)."
	random_item_response = gets.chomp.capitalize

	if random_item_response == "Y"
		grocery_list.delete(random_item)
		puts "Ok sweet. Then your revised list is:"
		show_grocery_list(grocery_list)
	end

	puts "Did you remember anything else that you wanted? (Y or N)."
	new_item_response = gets.chomp.capitalize
	if new_item_response == "Y"
		puts "Please tell me what that item is."
		new_item = gets.chomp.downcase
		grocery_list << new_item
		puts "Ok, here we go. Please see final list below:"
		show_grocery_list(grocery_list)
	else
		puts "Ok great, I'll just buy everything that's currently on the list."
	end

	save_grocery_list("new_grocery_list.txt", grocery_list)

end



the_user = get_user_info
greeting(the_user)
age_differential(the_user)
over_under_50(the_user)
age_and_gender_assumption(the_user)
are_you_a_whippersnapper(the_user)
grocery_shopping


# START OF ENUMERATION
def select_by_name(list_of_people, name)
	list_of_people.select { |person| person[:name] == name }
end

def select_authors(list_of_people)
	list_of_people.select { |person| person[:author] }
end

def find_by_email(list_of_people, email)
	list_of_people.select { |person| person[:email] == email }.first
end

author =	{ name: "Chris Markel", age: 27, gender: "M", author: true, email: "cmarkel5@gmail.com" }
rando =		{ name: "Chris Markel", age: 26, gender: "M", author: false, email: "rando@rando.com"}
gerry = 	{ name: "Gerry Pass", age: 28, gender: "M", author: true, email: "rgpass@gmail.com" }

all_users = [the_user, author, rando, gerry]

# author = all_people.reject { |person| person[:name] != "Chris Markel" }.first

authors = select_authors(all_users)

original_author = select_by_name(authors, "Chris Markel").first

#puts original_author[:name]
#END OF ENUMERATION






puts "Hey Mr. Instructor dude"


