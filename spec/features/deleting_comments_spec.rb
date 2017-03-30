require 'rails_helper.rb'

feature 'Deleting comments' do
  background do
    nice_user = FactoryGirl.create(:user)
    troll = FactoryGirl.create(:user, id: 2, email: 'troll@neckbeards.com', user_name: 'troll', password: 'repentant-troll')
    cool_post = create(:post, user_id: nice_user.id)
    offensive_comment = FactoryGirl.create(:comment, user_id: troll.id, post_id: cool_post.id)

    sign_in troll
    visit '/'
    expect(page).to have_content('nofilter')
    find(:xpath, "//a[contains(@href,'posts/#{cool_post.id}')]").click
    # expect(page).to have_css("div.comments#{cool_post.id}")
  end

  scenario 'user can delete their own comments' do
    # puts page.html
    expect(page).to have_content('Looks yummy!')
    click_link "delete-1"
    expect(page).to_not have_content('Looks yummy!')
  end
end
