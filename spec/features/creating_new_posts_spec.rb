require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/padthai.jpg")
    fill_in 'Caption', with: 'yum-yum, #noodletime'
    click_button 'Create Post'
    expect(page).to have_content('#noodletime')
    expect(page).to have_css("img[src*='padthai.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Nothing to see here'
    click_button 'Create Post'
    expect(page).to have_content('Forgetting something? You need an image to post here!')
  end
end
