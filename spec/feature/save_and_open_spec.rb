# frozen_string_literal: true

RSpec.describe 'Save and open', type: :feature do
  before { visit '/' }

  it 'page' do
    save_and_open_page
  end

  it 'screenshot' do
    save_and_open_screenshot
  end
end
