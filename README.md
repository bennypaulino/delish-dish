# DelishDish

DelishDish is a simple web-app for posting tasty dishes, as well as commenting on them!

## Built with:

* Ruby 2.3.3

* [Rails 4.2.8](https://guides.rubyonrails.org/v4.2.8/) - The web framework used

* PostgreSQL - Database

* [Bootstrap](https://getbootstrap.com/docs/3.3/) - CSS framework




## Technologies Used

* AJAX for deletion of comments

* [RSpec](https://github.com/rspec/rspec) & [Capybara](https://github.com/teamcapybara/capybara) for testing.

* [Travis CI](https://github.com/travis-ci/travis-ci) - Continuous Integration tool


### Automated Continuous Integration with Travis CI

Continuous Integration (CI) is the practice of integrating new code into the master branch frequently, to help detect merge conflicts, bugs, and improve the quality of the software a development team writes.

CI is usually accompanied by running an application's test suite against the latest code changes, and flagging any test failures that are found. Developers are expected to investigate and fix these failures to maintain a passing test suite and therefore quality.

[Travis CI](https://travis-ci.org) is a build server that helps automate the CI process. Travis CI runs an application's tests against the latest changes pushed to the application's code respository. In this project, Travis CI runs the project's tests (`rake test`) on pull requests and on changes to the master branch.

Travis CI configuration how-to and example:
- [.travis.yml](.travis.yml) - Travis CI's configuration file (with instructions)
- [DelishDish Travis CI build!](https://travis-ci.org/bennypaulino/delish-dish)
- Travis CI badge for DelishDish: [![Build Status](https://travis-ci.org/bennypaulino/delish-dish.svg?branch=master)](https://travis-ci.org/bennypaulino/delish-dish)


### What is being tested?

End to end testing from invalid submission to a valid submission for a post, including cropping an image, deleting a post, visiting a different user, testing the number of posts a user has, and more.


```ruby
require 'rails_helper'

feature 'User authentication' do
  background do
    user = FactoryGirl.create(:user)
  end

  scenario 'can log in from the index page' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'big@lebowski.com'
    fill_in 'Password', with: 'nicemarmot'

    click_button 'Log in'
    # puts page.html
    expect(page).to have_content('Signed in successfully')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end
end
```

## Acknowledgements

* [Factory Girl](https://github.com/thoughtbot/factory_bot) gem
* [Paperclip](https://github.com/thoughtbot/paperclip) gem for image handling.
