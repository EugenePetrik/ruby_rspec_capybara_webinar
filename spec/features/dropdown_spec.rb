# frozen_string_literal: true

RSpec.describe 'Dropdown page', type: :feature do
  before { visit '/dropdown' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Dropdown List')
  end

  it 'default option is selected' do
    within('div#content') do
      # Returns true if a field with the selected value is on the page
      expect(page).to have_select('dropdown', selected: 'Please select an option')
    end
  end

  it 'Option 1 is selected' do
    # Selects option name 'Option 1' in the given selector
    select('Option 1', from: 'dropdown')

    expect(page).to have_select('dropdown', selected: 'Option 1')
  end

  it 'Option 2 is selected' do
    # Selects option name 'Option 2' in the given selector
    select('Option 2', from: 'dropdown')

    expect(page).to have_select('dropdown', selected: 'Option 2')
  end
end
