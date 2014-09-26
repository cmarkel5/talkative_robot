require 'pry'

class Dog

	# constructor
	def initialize(name, age)
		@name = name
		@age = age
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
		puts "The dog's name is #{@name} who is #{@age} years old."
	end
end

my_dog = Dog.new("Miko", 1)
my_dog.greet

my_dog.age = 2
my_dog.greet

#binding.pry
