require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    @user = FactoryGirl.create(:user)
    sign_in @user
    visit '/'
    click_link 'New Post'
  end

  scenario 'can create a post' do

    attach_file('Image', "spec/files/images/padthai.jpg", match: :first)
    within(".post_caption", match: :first) do
      fill_in 'Caption', with: 'yum-yum, #noodletime'
    end
    click_button 'Create Post', match: :first
    expect(page).to have_content('#noodletime')
    expect(page).to have_css("img[src*='padthai.jpg']")
  end

  it 'needs an image to create a post' do
    within(".post_caption", match: :first) do
      fill_in 'Caption', with: 'Nothing to see here'
    end
    click_button 'Create Post', match: :first
    expect(page).to have_content("Your DelishDish couldn't be created, please check the form.")
  end
end
