require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid with all appropriate attributes" do
      @user = User.new(email: "email@email.com", first_name: "first", last_name: "last", 
                      password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it "is not valid with no password" do
      @user = User.new(email: "email@email.com", first_name: "first", last_name: "last", 
                      password: nil, password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is not valid with no password confirmation" do
      @user = User.new(email: "email@email.com", first_name: "first", last_name: "last", 
                      password: "password", password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "is not valid if password don't match" do
      @user = User.new(email: "email@email.com", first_name: "first", last_name: "last", 
                      password: "password", password_confirmation: "passwrod")
      expect(@user).to_not be_valid
    end

    it "is not valid without email" do
      @user = User.new(email: nil, first_name: "first", last_name: "last", 
                      password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is not valid if email is not unique regardless of case" do
      @user = User.new(email: "EMAIL@email.com", first_name: "first", last_name: "last", 
                      password: "password", password_confirmation: "password")
      @user.save
      @user2 = User.new(email: "email@email.COM", first_name: "first", last_name: "last", 
                      password: "password", password_confirmation: "password")             
      expect(@user2).to_not be_valid
    end

    it "is not valid without first name" do
      @user = User.new(email: "email@email.com", first_name: nil, last_name: "last", 
                      password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is not valid without last name" do
      @user = User.new(email: "email@email.com", first_name: "first", last_name: nil, 
                      password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is not valid if password is less than 8 characters" do
      @user = User.new(email: "email@email.com", first_name: "first", last_name: nil, 
                      password: "passwor", password_confirmation: "passwor")
      expect(@user).to_not be_valid
    end

  end
end
