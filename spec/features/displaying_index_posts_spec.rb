require 'rails_helper.rb'

feature 'Display posts on the index page' do
  scenario 'the index displays posts correctly' do
    user = FactoryGirl.create(:user)
    sign_in user
    pho = create(:post, caption: "Pho-sho", user_id: user.id)
    ribs = create(:post, caption: "bbq ribs", user_id: user.id)

    visit '/'
    expect(page).to have_content('Pho-sho')
    expect(page).to have_content('bbq ribs')
    expect(page).to have_css("img[src*='padthai.jpg']")
  end
end
