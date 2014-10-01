require 'spec_helper'
require './lib/user'

describe "User" do
  let(:user) { User.new( { name: "Chris Markel",
    age: 27, gender: "M" } ) }

  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:age) }
  it { should respond_to(:gender) }

  describe "to_s" do
    it "returns name, age, and gender stored in string" do
      expect(user.to_s).to eq("name = Chris Markel, age = 27, gender = M")
    end
  end

  describe "age_differential" do
    let(:age_in_question) { 75 }

    context "@age < 0" do
      it "returns proper message" do
        user = User.new( { age: -1 } )
        expected_message = "Based on your entry, you must not exist. Please enter a real age."
        expect(user.age_differential).to eq(expected_message)
      end
    end

    context "@age < age_in_question" do
      it "returns proper message" do
        user = User.new( { age: age_in_question - 1 } )
        expected_message = "You'll be 75 in 1 year(s)."
        expect(user.age_differential).to eq(expected_message)
      end
    end

    context "@age > age_in_question" do
      it "returns proper message" do
        user = User.new( { age: age_in_question + 1 } )
        expected_message = "You turned 75 1 year(s) ago."
        expect(user.age_differential).to eq(expected_message)
      end
    end
  
    context "@age == age_in_question" do
      it "returns proper message" do
        user = User.new( { age: age_in_question } )
        expected_message = "You're 75!"
        expect(user.age_differential).to eq(expected_message)
      end
    end
  end

  describe "age_based_message" do
    context "@age >= 23 && @age < 35" do
      it "returns proper message" do
        user = User.new( { age: 27 } )
        expected_message = "You are no longer a whippersnapper."
        expect(user.age_based_message).to eq(expected_message)
      end
    end
  end
end

