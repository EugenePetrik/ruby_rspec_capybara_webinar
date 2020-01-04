# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium-webdriver'

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
    # Preferences for logging - https://github.com/SeleniumHQ/selenium/wiki/DesiredCapabilities
    # Loggers Values: "OFF", "SEVERE", "WARNING", "INFO", "CONFIG", "FINE", "FINER", "FINEST", "ALL"
    loggingPrefs: {
      # Capture JavaScript errors in Browser
      browser: 'INFO',
      # Capture WebDriver severe errors
      driver: 'INFO'
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
  options.add_argument('window-size=1600,1268')
  # Runs Chrome in headless mode.
  options.add_argument('headless')

  # https://selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/Remote/Capabilities.html
  CAPABILITIES = Selenium::WebDriver::Remote::Capabilities.chrome(
    # Preferences for logging - https://github.com/SeleniumHQ/selenium/wiki/DesiredCapabilities
    # Loggers Values: "OFF", "SEVERE", "WARNING", "INFO", "CONFIG", "FINE", "FINER", "FINEST", "ALL"
    loggingPrefs: {
      # Capture JavaScript errors in Browser
      browser: 'INFO',
      # Capture WebDriver severe errors
      driver: 'INFO'
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
  options.add_argument('--window-size=1600,1268')
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

# Calling remote servers
# https://github.com/teamcapybara/capybara#calling-remote-servers
Capybara.app_host = 'https://the-internet.herokuapp.com'
# Change wait time (default is 2 seconds)
# https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends
Capybara.default_max_wait_time = 3
# Save screenshots
# https://github.com/teamcapybara/capybara#debugging
Capybara.save_path = 'tmp/capybara'
# Capybara finds elements
# https://github.com/teamcapybara/capybara#matching
Capybara.exact = true

RSpec.configure do |config|
  # Clear browser data before each test
  config.before do
    Capybara.reset_session!
    Capybara.execute_script 'try { localStorage.clear() } catch(err) { }'
    Capybara.execute_script 'try { sessionStorage.clear() } catch(err) { }'
  end

  # Save browser and driver logs
  config.after(:suite) do
    # Gather browser logs
    browser_errors = Capybara.page.driver.browser.manage.logs.get(:browser)
    # Gather driver logs
    driver_errors = Capybara.page.driver.browser.manage.logs.get(:driver)

    # Create tmp/logs folder if it does not exist
    Dir.mkdir('tmp/logs') unless Dir.exist?('tmp/logs')

    # Save browser logs to tmp/logs/chrome.log file
    open('tmp/logs/chrome.log', 'w') { |f| f <<  browser_errors }
    # Save driver logs to tmp/logs/chromedriver.log file
    open('tmp/logs/chromedriver.log', 'w') { |f| f << driver_errors }
  end
end
