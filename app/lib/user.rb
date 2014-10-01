require 'pry'
require './person'

class User < Person
  def initialize(args)
    super(args)
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
    "name = #{@name}, age = #{@age}, gender = #{@gender}"
  end

  def age_differential
    age_in_question = 75
    delta = (age_in_question - @age).abs
    case
    when @age < 0
      "Based on your entry, you must not exist. Please enter a real age."
    when @age < age_in_question
      "You'll be #{age_in_question} in #{delta} year(s)."
    when @age > age_in_question
      "You turned #{age_in_question} #{delta} year(s) ago."
    else
      "You're #{age_in_question}!"
    end
  end

  def age_based_message
    return "You are just a child."                        if @age > 0 && @age < 12 
    return "You are a whippersnapper."                    if @age >= 12 && @age < 23 
    return "You are no longer a whippersnapper."          if @age >= 23 && @age < 35 
    return "Your age is catching up to you a little bit." if @age >= 35 && @age < 50
    return "I bet you can't wait until retirement."       if @age >= 50 && @age < 65
    return "Retirement is nice, am I right?"              if @age >= 65 && @age < 85
    return "You're old."                                  if @age >= 85
  end

  def age_and_gender_based_message
    return "You must be a great grandfather."             if old? && male?
    return "You must be a great grandmother."             if old? && female?
    return "You must be a young boy."                     if young? && male?
    return "You must be a young girl."                    if young? && female?  
  end

  def greeting
    return "Hi #{@name} who is #{@age} years old!"
  end

  # private
    def old?
      @age > 85
    end

    def young?
      @age < 12
    end

    def male?
      @gender == "M" || @gender == "m" || @gender == "Male" || @gender == "male"
    end

    def female?
      @gender == "F" || @gender == "f" || @gender == "Female" || @gender == "female"
    end
end

