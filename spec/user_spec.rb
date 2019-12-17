<<<<<<< HEAD
# RSpec.describe User, type: :model do

#   describe 'Validations' do
#     it "is valid" do
#       user = User.new(
#         first_name: 'first_name',
#         last_name: 'last_name',
#         email: 'test2@test.com',
#         password: 'abcdef',
#         password_confirmation: 'abcdef'
#       )
#       expect(user).to be_valid
#     end
  
#     it "email is missing" do
#       user = User.new(email: nil)
#       expect(user).to be_invalid
#       expect(user.errors[:email]).to include("can't be blank")

#       user.email = 'test@test.com' # valid state
#       user.valid?
#       expect(user.errors[:email]).not_to include("can't be blank")
#     end
  
#     it "first name is missing" do
#       user = User.new(first_name: nil)
#       expect(user).to be_invalid
#       expect(user.errors[:first_name]).to include("can't be blank")
#       user.first_name = 'first_name' # valid state
#       user.valid? 
#       expect(user.errors[:first_name]).not_to include("can't be blank")
#     end

#     it "last name is missing" do
#       user = User.new(last_name: nil)
#       expect(user).to be_invalid
#       expect(user.errors[:last_name]).to include("can't be blank")
#       user.last_name = 'last_name' # valid state
#       user.valid? 
#       expect(user.errors[:last_name]).not_to include("can't be blank")
#     end

#     it "password don't match" do
#       user = User.new(
#         first_name: 'first_name',
#         last_name: 'last_name',
#         email: 'test2@test.com',
#         password: 'hogehoge',
#         password_confirmation: 'hoge'
#       )
#       user.valid?
#       expect(user.errors[:password_confirmation]).to be_present
#     end

#     it 'email must be unique' do
#       user = User.new
#       user.first_name = 'first_name'
#       user.last_name = 'last_name'
#       user.email = 'test@test.com'
#       user.password = 'hogehoge'
#       user.password_confirmation = 'hogehoge'
#       user.save

#       u = User.new
#       u.first_name = 'first_name'
#       u.last_name = 'last_name'
#       u.email = 'test@test.com'
#       u.password = 'hogehoge'
#       u.password_confirmation = 'hogehoge'
#       u.save

#       expect(u.errors[:email].first).to eq('has already been taken')
#     end

#     it 'password length less than 5 characters is invalid' do
#       user = User.new
#       user.first_name = 'first_name'
#       user.last_name = 'last_name'
#       user.email = 'test@test.com'
#       user.password = '1234'
#       user.password_confirmation = '1234'
#       expect(user).to be_invalid
#     end

#     it 'password length must be at-least 5 characters' do
#       user = User.new
#       user.first_name = 'first_name'
#       user.last_name = 'last_name'
#       user.email = 'test@test.com'
#       user.password = '12345'
#       user.password_confirmation = '12345'
#       expect(user).to be_valid
#     end
#   end


#   describe '.authenticate_with_credentials' do
#     it 'should pass with valid credentials' do
#       user = User.new(
#         first_name: 'first_name',
#         last_name: 'last_name',
#         email: 'test@test.com',
#         password: 'hogehoge',
#         password_confirmation: 'hogehoge'
#       )
#       user.save

#       user = User.authenticate_with_credentials('test@test.com', 'hogehoge')
#       expect(user).not_to be(nil)
#     end

#     it 'should not pass with invalid credentials' do
#       user = User.new(
#         first_name: 'first_name',
#         last_name: 'last_name',
#         email: 'test@test.com',
#         password: 'hogehoge',
#         password_confirmation: 'hogehoge'
#       )
#       user.save

#       user = User.authenticate_with_credentials('test@test.com', 'hogehoge3')
#       expect(user).to be(nil)
#     end

#     it 'should pass even with spaces present in email' do
#       user = User.new(
#         first_name: 'first_name',
#         last_name: 'last_name',
#         email: 'test@test.com',
#         password: 'hogehoge',
#         password_confirmation: 'hogehoge'
#       )
#       user.save

#       user = User.authenticate_with_credentials('  test@test.com  ', 'hogehoge')
#       expect(user).not_to be(nil)
#     end

#     it 'should pass even with caps present in email' do
#       user = User.new(
#         first_name: 'first_name',
#         last_name: 'last_name',
#         email: 'test@test.com',
#         password: 'hogehoge',
#         password_confirmation: 'hogehoge'
#       )
#       user.save

#       user = User.authenticate_with_credentials('tesT@tEst.com', 'hogehoge')
#       expect(user).not_to be(nil)
#     end
#   end

# end
=======
require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is created with a password field" do
      @user = User.new(

        name: "Pat",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      expect(@user.password_digest).to be_present
    end
    it "is created with a password_confirmation field" do
      @user = User.new(
        
        name: "Pat",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      expect(@user.password_confirmation).to be_present
    end
    it "is not valid without a name" do
      @user = User.new(
        name: nil,
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      expect(@user).to_not be_valid
    end
    
    it "is not valid without a email" do
      @user = User.new(
        name: "Pat",       
        email: nil,
        password: "123456",
        password_confirmation: "123456")
      expect(@user).to_not be_valid
    end
    it "is email must be unique and not case sensitive" do
      user = User.create(
        name: "Pat",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "123456")
      user1 =  User.create(
       
        name: "Kevin",
        email: "PAT@GMAIL.COM",
        password: "123456",
        password_confirmation: "123456")
      expect(user1).to_not be_valid
    end
    it "is password and password_confirmation fields is not the same" do
      @user = User.new(
        name: "Pat",
        email: "pat@gmail.com",
        password: "123456",
        password_confirmation: "654321")
      expect(@user.password).not_to eq(@user.password_confirmation)
    end
    it "is not when password min length is less then 5" do
      @user = User.new(
        name: "Pat",
        email: "pat@gmail.com",
        password: "123",
        password_confirmation: "123")
        expect(@user).to_not be_valid
    end
    it "is password min length is 5" do
      @user = User.new(
        name: "Pat",
        email: "pat@gmail.com",
        password: "12345",
        password_confirmation: "12345")
        expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should still be authenticated successfully" do
      @user = User.new(
        name: "Pat",
        email: "pat@gmail.com",
        password: "12345",
        password_confirmation: "12345")
      @user.save!
        login = @user.authenticate_with_credentials("pat@gmail.com", @user.password)
        expect(login).to be_truthy
    end
    it "should be authenticated successfully if a visitor types spaces before and/or after email" do
      @user = User.new(
        name: "Pat",
        email: "    pat@gmail.com   ",
        password: "12345",
        password_confirmation: "12345")
      @user.save!
        login = @user.authenticate_with_credentials("pat@gmail.com", @user.password)
        expect(login).to be_truthy
    end
    it "should be authenticated successfully if a visitor types wrong case for email" do
      @user = User.new(
        name: "Pat",
        email: "pat@gmaIL.COM",
        password: "12345",
        password_confirmation: "12345")
      @user.save!
        login = @user.authenticate_with_credentials("PaT@GMaiL.com", @user.password)
        expect(login).to be_truthy
    end
  end
end
>>>>>>> feature/user-specs
