require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = User.new(email: "boaty@mcboatface.com",
                            user_name: 'boatymcboatface',
                            password: 'secretpassword',
                            password_confirmation: 'secretpassword') }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:user_name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when user_name is not present" do
    before { @user.user_name = " " }
    it { should_not be_valid }
  end

  describe "when user_name is too short" do
    before { @user.user_name = "blah" }
    it { should_not be_valid }
  end

  describe "email addresses should be unique" do
    before do
      duplicate_user = @user.dup
      duplicate_user.save
    end

    it { should_not be_valid }
  end

  describe 'when a password is not present' do
    before do
    @user = User.new(email: "forgetful@example.com",
                     password: " ",
                     password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "x" * 4 }
    it { should be_invalid }
  end
end
