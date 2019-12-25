# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium-webdriver'

# Register Chrome
Capybara.register_driver(:selenium_chrome) do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('window-size=1600,1268')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

# Register Firefox
Capybara.register_driver(:selenium) do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('window-size=1600,1268')

  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options
  )
end

# Register Chrome Headless
Capybara.register_driver(:selenium_chrome_headless) do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('window-size=1600,1268')
  options.add_argument('headless')
  options.add_argument('disable-gpu')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

# Register Firefox Headless
Capybara.register_driver(:selenium_headless) do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('--headless')
  options.add_argument('--window-size=1600,1268')

  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options
  )
end

# Which default browser do you want Selenium WebDriver to use?
# DRIVER=selenium_chrome => Selenium driving Chrome
# DRIVER=selenium_chrome_headless => Selenium driving Chrome in a headless configuration
# DRIVER=selenium => Selenium driving Firefox
# DRIVER=selenium_headless => Selenium driving Firefox in a headless configuration
# https://github.com/teamcapybara/capybara#selenium
if ENV['DRIVER']
  driver = ENV['DRIVER'].to_sym
  Capybara.default_driver = driver
  Capybara.javascript_driver = driver
else
  Capybara.default_driver = :selenium_chrome_headless
  Capybara.javascript_driver = :selenium_chrome_headless
end

Capybara.app_host = 'https://the-internet.herokuapp.com'
Capybara.default_max_wait_time = 3
Capybara.save_path = 'tmp/capybara'
Capybara.exact = true

RSpec.configure do |config|
  config.append_before do
    Capybara.reset_session!
    Capybara.execute_script 'try { localStorage.clear() } catch(err) { }'
    Capybara.execute_script 'try { sessionStorage.clear() } catch(err) { }'
  end
end
