require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is created with a password field" do
      @user = User.new(

        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      expect(@user.password_digest).to be_present
    end
    it "is created with a password_confirmation field" do
      @user = User.new(
        
        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      expect(@user.password_confirmation).to be_present
    end
    it "is not valid without a name" do
      @user = User.new(
        first_name: nil,
        last_name: nil,
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      expect(@user).to_not be_valid
    end
    
    it "is not valid without a email" do
      @user = User.new(
        first_name: "Pat",
        last_name: "Simmons",       
        email: nil,
        password: "123456",
        password_confirmation: "123456")
      expect(@user).to_not be_valid
    end
    it "is email must be unique and not case sensitive" do
      user = User.create(
        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      user1 =  User.create(
       
        first_name: "Kevin",
        last_name: "Jackson",
        email: "PAT@GMAIL.COM",
        password: "123456",
        password_confirmation: "123456")
      expect(user1).to_not be_valid
    end
    it "is password and password_confirmation fields is not the same" do
      @user = User.new(
        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "654321")
      expect(@user.password).not_to eq(@user.password_confirmation)
    end
    it "is not when password min length is less then 5" do
      @user = User.new(
        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmail.com",
        password: "123",
        password_confirmation: "123")
        expect(@user).to_not be_valid
    end
    it "is password min length is 5" do
      @user = User.new(
        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmail.com",
        password: "12345",
        password_confirmation: "12345")
        expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should still be authenticated successfully" do
      @user = User.new(
        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmail.com",
        password: "12345",
        password_confirmation: "12345")
      @user.save!
        login = @user.authenticate_with_credentials("pat@gmail.com", @user.password)
        expect(login).to be_truthy
    end
    it "should be authenticated successfully if a visitor types spaces before and/or after email" do
      @user = User.new(
        first_name: "Pat",
        last_name: "Simmons",
        email: "    pat@gmail.com   ",
        password: "12345",
        password_confirmation: "12345")
      @user.save!
        login = @user.authenticate_with_credentials("pat@gmail.com", @user.password)
        expect(login).to be_truthy
    end
    it "should be authenticated successfully if a visitor types wrong case for email" do
      @user = User.new(
        first_name: "Pat",
        last_name: "Simmons",
        email: "pat@gmaIL.COM",
        password: "12345",
        password_confirmation: "12345")
      @user.save!
        login = @user.authenticate_with_credentials("PaT@GMaiL.com", @user.password)
        expect(login).to be_truthy
    end
  end
end

