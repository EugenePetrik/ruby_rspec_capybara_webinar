# frozen_string_literal: true

require 'capybara/rspec'
require 'webdrivers/chromedriver'
require 'webdrivers/geckodriver'

# Capybara drivers - https://github.com/teamcapybara/capybara#drivers

# Register Chrome
Capybara.register_driver(:selenium_chrome) do |app|
  # Add options for Chrome browser
  # https://selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/Chrome/Options.html
  options = Selenium::WebDriver::Chrome::Options.new
  # Sets the initial window size.
  options.add_argument('start-maximized')

  # https://selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/Remote/Capabilities.html
  CAPABILITIES = Selenium::WebDriver::Remote::Capabilities.chrome(
    # Preferences for logging - https://github.com/SeleniumHQ/selenium/wiki/DesiredCapabilities.
    # Logging Prefs: "browser", "driver", "client", "server".
    # Loggers Values: "OFF", "SEVERE", "WARNING", "INFO", "CONFIG", "FINE", "FINER", "FINEST", "ALL".
    loggingPrefs: {
      # Capture JavaScript errors in Browser
      browser: 'INFO'
    }
  )

  # Configuring and adding drivers
  # https://github.com/teamcapybara/capybara#configuring-and-adding-drivers
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: CAPABILITIES,
    options: options
  )
end

# Register Chrome Headless
Capybara.register_driver(:selenium_chrome_headless) do |app|
  # Add options for Chrome browser
  # https://selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/Chrome/Options.html
  options = Selenium::WebDriver::Chrome::Options.new
  # Sets the initial window size.
  options.add_argument('window-size=1980,1024')
  # Runs Chrome in headless mode.
  options.add_argument('headless')

  # https://selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/Remote/Capabilities.html
  CAPABILITIES = Selenium::WebDriver::Remote::Capabilities.chrome(
    # Preferences for logging - https://github.com/SeleniumHQ/selenium/wiki/DesiredCapabilities.
    # Logging Prefs: "browser", "driver", "client", "server".
    # Loggers Values: "OFF", "SEVERE", "WARNING", "INFO", "CONFIG", "FINE", "FINER", "FINEST", "ALL".
    loggingPrefs: {
      # Capture JavaScript errors in Browser
      browser: 'INFO'
    }
  )

  # Configuring and adding drivers
  # https://github.com/teamcapybara/capybara#configuring-and-adding-drivers
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: CAPABILITIES,
    options: options
  )
end

# Register Firefox
Capybara.register_driver(:selenium) do |app|
  # Add options for Firefox browser
  # https://selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/Firefox/Options.html
  options = Selenium::WebDriver::Firefox::Options.new
  # Sets the initial window size.
  options.add_argument('start-maximized')

  # Configuring and adding drivers
  # https://github.com/teamcapybara/capybara#configuring-and-adding-drivers
  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options
  )
end

# Register Firefox Headless
Capybara.register_driver(:selenium_headless) do |app|
  # Add options for Firefox browser
  # https://selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/Firefox/Options.html
  options = Selenium::WebDriver::Firefox::Options.new
  # Sets the initial window size.
  options.add_argument('--window-size=1980,1024')
  # Runs Chrome in headless mode.
  options.add_argument('--headless')

  # Configuring and adding drivers
  # https://github.com/teamcapybara/capybara#configuring-and-adding-drivers
  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options
  )
end

# Run tests in specific browsers:
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

# The default host to use when giving a relative URL to visit
# https://github.com/teamcapybara/capybara#calling-remote-servers
Capybara.app_host = 'https://the-internet.herokuapp.com'
# The maximum number of seconds to wait for asynchronous processes to finish (default is 2 seconds).
# https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends
Capybara.default_max_wait_time = 3
# Where to put pages saved through save_page, save_screenshot, save_and_open_page, or save_and_open_screenshot.
# https://github.com/teamcapybara/capybara#debugging
Capybara.save_path = 'tmp/capybara'
# Whether locators are matched exactly or with substrings.
# https://github.com/teamcapybara/capybara#matching
Capybara.exact = true

RSpec.configure do |config|
  # Clear browser data before each test
  config.before do
    Capybara.reset_session!
  end

  # Save browser and driver logs
  config.after(:suite) do
    # Gather logs
    browser_logs = Capybara.page.driver.browser.manage.logs.get(:browser)

    # Create tmp/logs folder if it does not exist
    Dir.mkdir('tmp') unless Dir.exist?('tmp')

    # Save logs to file
    logs = browser_logs.map(&:to_s).join("\n\n")
    open('tmp/chrome.log', 'w') { |f| f <<  logs }
  end
end
