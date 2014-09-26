require 'pry'

class Person

	# constructor
	def initialize(name, age, groceries)
		@name = name
		@age = age
		@groceries = groceries
	end

	# getter (aka accessor method)
	def name
		@name
	end

	def age
		@age
	end

	#setter (aka mutator method)
	def age=(age)
		@age = age
	end

	def greet
		puts "Hello #{@name} who is #{@age} years old."
		@groceries.print
	end

	def groceries
		@groceries
	end
end

class GroceryList
	def intialize(items)
		@items = items
	end

	def print
		puts items
	end

	def items
		@items
	end
end

gl = GroceryList.new(['eggs', 'bacon'])
mike = Person.new("Mike", 34, gl)
mike.greet

my_dog = Dog.new("Miko", 1)
my_dog.greet

my_dog.age = 2
my_dog.greet

#binding.pry
