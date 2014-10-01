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
    @items.each_index { |i| puts "Item #{i+1} -- #{@items[i]}" }
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