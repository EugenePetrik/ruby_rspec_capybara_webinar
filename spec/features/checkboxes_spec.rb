# frozen_string_literal: true

RSpec.describe 'Checkboxes page', type: :feature do
  before { visit '/checkboxes' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Checkboxes')
  end

  it 'shows 2 checkboxes' do
    expect(all(:css, 'input[type="checkbox"]').size).to eq 2
  end

  it 'checks that checkbox 1 is not selected' do
    expect(find(:xpath, '//input[@type="checkbox"][1]')).not_to be_checked
  end

  it 'checks that checkbox 2 is selected' do
    expect(find(:xpath, '//input[@type="checkbox"][2]')).to be_checked
  end

  # Select checkbox by id, name or label text
  # check('A Checkbox')

  # Deselect checkbox by id, name or label text
  # uncheck('A Checkbox')

  # Choose radio button by id, name or label text
  # choose('A Radio Button')
end
