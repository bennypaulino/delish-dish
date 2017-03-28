feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'User name', with: 'happyrailsdev'
    fill_in 'Email', with: 'happyrailsdev@rubynirvana.com'
    fill_in 'Password', with: 'supersecretpassword', match: :first
    fill_in 'Password confirmation', with: 'supersecretpassword'

    click_button 'Sign up'
    expect(page).to have_content('Welcome to DelishDish! You have signed up successfully.')
   end
end
