require 'rails_helper.rb'

feature "Display an individual post" do
  scenario 'Can click and view a single post' do
    ramen_post = create(:post, caption: "ramen noodle soup")

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    expect(page.current_path).to eq('post_path(ramen_post)')
  end
end
