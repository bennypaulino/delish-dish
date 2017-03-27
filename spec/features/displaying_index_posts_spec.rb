require 'rails_helper.rb'

feature 'Display posts on the index page' do
  scenario 'the index displays posts correctly' do
    pho = create(:post, caption: "Pho-sho")
    ribs = create(:post, caption: "bbq ribs")

    visit '/'
    expect(page).to have_content('Pho-sho')
    expect(page).to have_content('bbq ribs')
    expect(page).to have_css("img[src*='padthai.jpg']")
  end
end
