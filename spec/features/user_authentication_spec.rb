require 'rails_helper'

feature 'User authentication' do
  background do
    user = FactoryGirl.create(:user)
  end

  scenario 'can log in from the index page' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'glassyeyes@hypnotoad.com'
    fill_in 'Password', with: 'gettingsleepy'

    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end
end
