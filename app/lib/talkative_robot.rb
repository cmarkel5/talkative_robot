require 'pry'
require './user'
require './grocery_list'

user_info = User.get_info
@current_user = User.new(user_info)
puts @current_user.greeting
puts @current_user.age_based_message
puts @current_user.age_and_gender_based_message
puts @current_user.age_differential

items = ["eggs", "milk", "bread", "cheese", "goldfish"]
@grocery_list = GroceryList.new(items)
@grocery_list.go_shopping











