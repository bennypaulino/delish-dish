require 'rails_helper.rb'

feature "Destroying posts" do
  background do
    expendable = create(:post, caption: "Big mistake")

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
