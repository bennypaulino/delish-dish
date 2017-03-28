require 'rails_helper.rb'

feature "Display an individual post" do
  scenario 'Can click and view a single post' do
    ramen_post = create(:post, caption: "ramen noodle soup")

    visit '/'
    # puts page.html
    find(:xpath, "//a[contains(@href,'posts/#{ramen_post.id}')]").click
    expect(page).to have_content('ramen noodle')
    expect(page.current_path).to eq(post_path(ramen_post.id))
  end
end
