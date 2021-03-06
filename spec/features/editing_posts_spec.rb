require 'rails_helper.rb'

feature "Editing posts" do
  background do
    user = FactoryGirl.create(:user)
    sign_in user
    ruh_roh = create(:post, caption: "Wrong pic", user_id: user.id)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{ruh_roh.id}')]").click
    expect(page).to have_content("Wrong pic")
    click_link 'Edit Post'
  end

  scenario 'Whoops! User wants to edit their post' do
    expect(page).to have_content('Edit your delicious dish')
    within all(".post_caption")[1] do
      fill_in 'Caption', with: "D'oh! Ummm...yeah, you never saw that picture"
    end
    click_button 'Update Post'
    expect(page).to have_content('Dish updated!')
    # puts page.html
    expect(page).to have_content("D'oh! Ummm...yeah, you never saw that picture")
  end

  scenario 'Attempt to update image with wrong file' do
    within(".form-wrapper") do
      attach_file('Image', 'spec/files/yummy.zip')
    end
    click_button 'Update Post'

    expect(page).to have_content('Something is wrong with your form, please check it again...')
  end
end
