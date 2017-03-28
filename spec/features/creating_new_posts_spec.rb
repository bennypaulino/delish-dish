require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    @user = FactoryGirl.create(:user)
    sign_in @user
    visit '/'
    click_link 'New Post'
  end

  scenario 'can create a post' do
    attach_file('Image', "spec/files/images/padthai.jpg")
    fill_in 'Caption', with: 'yum-yum, #noodletime'
    click_button 'Create Post'
    expect(page).to have_content('#noodletime')
    expect(page).to have_css("img[src*='padthai.jpg']")
  end

  it 'needs an image to create a post' do
    fill_in 'Caption', with: 'Nothing to see here'
    click_button 'Create Post'
    expect(page).to have_content("Your DelishDish couldn't be created, please check the form.")
  end
end
