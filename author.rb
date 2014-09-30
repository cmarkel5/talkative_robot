#   def select_by_name(list_of_people, name)
#   list_of_people.select { |person| person[:name] == name }
#   end

#   def select_authors(list_of_people)
#     list_of_people.select { |person| person[:author] }
#   end

#   def find_by_email(list_of_people, email)
#     list_of_people.select { |person| person[:email] == email }.first
#   end

#   author =  { name: "Chris Markel", age: 27, gender: "M", author: true, email: "cmarkel5@gmail.com" }
#   rando =   { name: "Chris Markel", age: 26, gender: "M", author: false, email: "rando@rando.com"}
#   gerry =   { name: "Gerry Pass", age: 28, gender: "M", author: true, email: "rgpass@gmail.com" }

#   all_users = [current_user, author, rando, gerry]

#   # author = all_people.reject { |person| person[:name] != "Chris Markel" }.first

#   authors = select_authors(all_users)

#   original_author = select_by_name(authors, "Chris Markel").first

#   puts original_author[:name]
# end
