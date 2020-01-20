# frozen_string_literal: true

RSpec.describe 'Debugging', type: :feature do
  # https://github.com/teamcapybara/capybara#debugging

  before { visit '/' }

  it 'save and open page' do
    # Generates html file
    save_and_open_page
  end

  it 'save and open screenshot' do
    # Generates html file and screenshot
    save_and_open_screenshot
  end
end
