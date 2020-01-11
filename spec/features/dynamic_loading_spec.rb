# frozen_string_literal: true

RSpec.describe 'Dynamic Loading page', type: :feature do
  before { visit '/dynamic_loading/1' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Dynamically Loaded Page Elements')
    expect(page).to have_css('h4', text: 'Example 1: Element on page that is hidden')
  end

  it 'shows Start button' do
    # Capybara matcher for presence of button or link
    expect(page).to have_selector(:link_or_button, 'Start')
  end

  it 'waits "Hello World" content' do
    click_button('Start')

    using_wait_time 10 do
      within('#finish') do
        expect(page).to have_content('Hello World!')
      end
    end
  end
end
