require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  config.before(:each, :js) do
    if Capybara.javascript_driver == :selenium
      page.driver.browser.manage.window.maximize
    end
  end
end
