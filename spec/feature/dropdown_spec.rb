# frozen_string_literal: true

RSpec.describe 'Dropdown page', type: :feature do
  before { visit '/dropdown' }

  it 'title should be visible' do
    expect(page).to have_css('h3', text: 'Dropdown List')
  end

  it 'default option is selected' do
    within('div#content') do
      expect(page).to have_select('dropdown', selected: 'Please select an option')
    end
  end

  it 'Option 1 is selected' do
    select('Option 1', from: 'dropdown')

    expect(page).to have_select('dropdown', selected: 'Option 1')
  end

  it 'Option 2 is selected' do
    select('Option 2', from: 'dropdown')

    expect(page).to have_select('dropdown', selected: 'Option 2')
  end
end
