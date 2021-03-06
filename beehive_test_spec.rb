
require 'rubygems'
require 'capybara'
require 'capybara/rspec'
require 'rspec/expectations'
require 'capybara/dsl'
require 'capybara/poltergeist'


Capybara.run_server = false
Capybara.current_driver = :poltergeist  #select different driver than default RackTest
Capybara.javascript_driver = :poltergeist


Capybara.app_host = 'https://collections-pprd.library.nd.edu/'

RSpec.configure do |config|
    config.include Capybara::DSL
end

print "Visiting Beehive home page"


#Visiting Digital Exhibits and Collections and checking the page title "Digital Exhibits and Collections"
print "Testing"

feature 'Explore', :js => true do
   scenario 'TEST: validating page title' do
     page.driver.browser.js_errors = false  # choosing not to display page errors as test runs.
     visit '/'


    within('#content') do
    expect(page).to have_text('Featured Collections')
    end

    end
end
