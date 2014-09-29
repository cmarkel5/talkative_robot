require 'pry'

class Person
	def initialize(args)
		@name 	= args[:name]
		@age  	= args[:age]
		@gender = args[:gender]
	end
end

class User < Person
	def initialize(args)
		super
	end

	def self.get_info
		user = {}

		puts "Input user's name (first & last)."
		user[:name] = gets.chomp.capitalize

		puts "Input user's age."
		user[:age] = gets.chomp.to_i

		puts "Input user's gender ('M' or 'F')."
		user[:gender] = gets.chomp.capitalize

		user
	end

	def over_under_50
		puts @age > 50 ? "You are a person of experience!" : "You have much to learn grasshopper."
	end

	def age_differential
		case
		when @age < 0
			puts "Based on your entry, you must not exist. Please enter a real age."
		when @age < 75
			puts "You'll be 75 in #{75 - @age} years."
		when @age > 75
			puts "You turned 75 #{@age - 75} years ago."
		else
			puts "You're 75!"
		end
	end

	def age_and_gender_assumption
		if @age < 18 && @gender == "M"
			puts "You are a young BOY!"
		elsif @age < 18 && @gender == "F"
			puts "You are a young GIRL!"
		elsif @age > 90 && @gender == "M"
			puts "Are you a great-great grandfather?"
		elsif @age > 90 && @gender == "F"
			puts "Are you a great-great grandmother?"	
		end
	end

	def whippersnapper?
		@age < 23
	end

	def whippersnapper_message
		puts whippersnapper? ? "You're still a young whippersnapper!" : "You're no longer a whippersnapper..."
	end

	def old?
		@age > 50
	end

	def greeting
		puts "Hi #{@name} who is #{@age} years old!"
		puts old? ? 'You\'re kind of old.' : 'You\'re not "old" yet.'
	end
end

user_info = User.get_info
@current_user = User.new(user_info)
@current_user.greeting
@current_user.whippersnapper_message
@current_user.age_differential
@current_user.over_under_50
@current_user.age_and_gender_assumption


# class Author < Person
# 	def initialize(args)
# 		super
# 	end

# 	def select_by_name(list_of_people, name)
# 	list_of_people.select { |person| person[:name] == name }
# 	end

# 	def select_authors(list_of_people)
# 		list_of_people.select { |person| person[:author] }
# 	end

# 	def find_by_email(list_of_people, email)
# 		list_of_people.select { |person| person[:email] == email }.first
# 	end

# 	author =	{ name: "Chris Markel", age: 27, gender: "M", author: true, email: "cmarkel5@gmail.com" }
# 	rando =		{ name: "Chris Markel", age: 26, gender: "M", author: false, email: "rando@rando.com"}
# 	gerry = 	{ name: "Gerry Pass", age: 28, gender: "M", author: true, email: "rgpass@gmail.com" }

# 	all_users = [current_user, author, rando, gerry]

# 	# author = all_people.reject { |person| person[:name] != "Chris Markel" }.first

# 	authors = select_authors(all_users)

# 	original_author = select_by_name(authors, "Chris Markel").first

# 	puts original_author[:name]
# end


class GroceryList
	def initialize(items)
		@items = items
	end

	def go_shopping
		show_list
		item_list_check
		new_item_process
		save_to_file("grocery_list.txt")
	end

	def save_to_file(file)
		IO.write(file, @items.join(", "))
	end

	def show_list
		puts "I have a list of groceries that I need from the store. The list is below if you could grab these items:"
		@items.each_index { |i| puts "Item #{i+1} -- #{@items[i]}"}
	end

	def item_list_check
		random_item = @items.sample
		puts "Wait, we might already have #{random_item}. Do we? (Y or N)."
		random_item_response = gets.chomp.capitalize
		if random_item_response == "Y"
			@items.delete(random_item)
			puts "Ok sweet. Then your revised list is:"
			show_list
		end
	end

	def new_item_process	
		puts "Did you remember anything else that you wanted? (Y or N)."
		new_item_response = gets.chomp.capitalize
		if new_item_response == "Y"
			puts "Please tell me what the item is."
			new_item = gets.chomp.downcase
			@items << new_item
			puts "Ok, here we go. Please see final list below:"
			show_list
		else
			puts "Ok great, I'll just buy everything that's currently on the list."
		end
	end
end

items = ["eggs", "milk", "bread", "cheese", "goldfish"]
@grocery_list = GroceryList.new(items)
@grocery_list.go_shopping











