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

		puts "Input your name (first & last)."
		user[:name] = gets.chomp.capitalize

		puts "Input your age."
		user[:age] = gets.chomp.to_i

		puts "Input your gender ('M' or 'F')."
		user[:gender] = gets.chomp.capitalize

		user
	end

	def to_s
		"name = {@name}, age = #{@age}, gender = #{@gender}"
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

	def age_based_message
		puts "You are just a child." 												if @age > 0 && @age < 12 
		puts "You are a whippersnapper." 										if @age >= 12 && @age < 23 
		puts "You are no longer a whippersnapper." 					if @age >= 23 && @age < 35 
		puts "Your age is catching up to you a little bit."	if @age >= 35 && @age < 50
		puts "I bet you can't wait until retirement."				if @age >= 50 && @age < 65
		puts "Retirement is nice, am I right?"							if @age >= 65 && @age < 85
		puts "You're old."																	if @age >= 85
	end

	def age_and_gender_based_message
		puts "You must be a great grandfather."							if old? && male?
		puts "You must be a great grandmother."							if old? && female?
		puts "You must be a young boy."											if young? && male?
		puts "You must be a young girl."										if young? && female?	
	end

	def greeting
		puts "Hi #{@name} who is #{@age} years old!"
	end

	private
		def old?
			@age > 85
		end

		def young?
			@age < 12
		end

		def male?
			@gender = "M" || @gender = "m" || @gender = "Male" || @gender = "male"
		end

		def female?
			@gender = "F" || @gender = "f" || @gender = "Female" || @gender = "female"
		end
end

user_info = User.get_info
@current_user = User.new(user_info)
@current_user.greeting
@current_user.age_based_message
@current_user.age_and_gender_based_message
@current_user.age_differential

class GroceryList
	def initialize(items)
		@items = items
	end

	def go_shopping
		shopping_favor
		show_list
		item_list_check
		new_item_process
		save_to_file("grocery_list.txt")
	end

	def save_to_file(file)
		IO.write(file, @items.join(", "))
	end

	def shopping_favor
		puts "I have a list of groceries that I need from the store. The list is below if you could grab these items:"
	end

	def show_list
		@items.each_index { |i| puts "Item #{i+1} -- #{@items[i]}"}
	end

	def item_list_check
		random_item ||= @items.sample
		puts "Wait, we might already have #{random_item}. Do we? (Y or N)."
		random_item_response = gets.chomp.capitalize
		if random_item_response == "Y"
			@items.delete(random_item)
			puts "Ok sweet. Then your revised list is:"
			show_list
		end
	end

	private
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











