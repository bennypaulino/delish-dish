require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @post = create(:post, caption: "Cheeeesecake!", user_id: @user.id)
  end

  subject { @post }

  it { should respond_to(:id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:caption) }
  it { should respond_to(:image) }

  it { should be_valid }

  describe "when title is not present" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "title should be at most 60 characters" do
    before { @post.title = "y" * 61}
    it { should_not be_valid }
  end

  describe "when post caption is too short" do
    before { @post.caption = "No" }
    it { should_not be_valid }
  end

  describe "post caption should be at most 200 characters" do
    before { @post.caption = "z" * 201 }
    it { should_not be_valid }
  end
end
