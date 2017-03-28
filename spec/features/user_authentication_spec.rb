require 'rails_helper'

feature 'User authentication' do
  background do
    user = FactoryGirl.create(:user)
  end

  scenario 'can log in from the index page' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'big@lebowski.com'
    fill_in 'Password', with: 'nicemarmot'

    click_button 'Log in'
    # puts page.html
    expect(page).to have_content('Signed in successfully')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end
end
