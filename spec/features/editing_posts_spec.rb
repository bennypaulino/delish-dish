require 'rails_helper.rb'

feature "Editing posts" do
  background do
    ruh_roh = create(:post, caption: "Wrong pic")

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{ruh_roh.id}')]").click
    expect(page).to have_content("Wrong pic")
    click_link 'Edit Post'
  end

  scenario 'Whoops! User wants to edit their post' do
    fill_in 'Caption', with: "D'oh! Ummm...yeah, you never saw that picture"
    click_link 'Update Post'
    expect(page).to have_content('Dish updated!')
    expect(page).to have_content("D'oh! Ummm...yeah, you never saw that picture")
  end
end
