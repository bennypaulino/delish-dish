require 'rails_helper.rb'

feature "Destroying posts" do
  background do
    user = FactoryGirl.create(:user)
    sign_in user
    expendable = create(:post, caption: "Big mistake", user_id: user.id)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{expendable.id}')]").click
    expect(page).to have_content("Big mistake")
    click_link 'Edit Post'
  end

  scenario 'User can delete a single post' do
    click_link 'Delete Post'
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Problem solved! Dish deleted.')
    expect(page).to_not have_content('Big mistake')
  end
end
