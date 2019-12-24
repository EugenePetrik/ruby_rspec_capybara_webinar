# frozen_string_literal: true

RSpec.describe 'Key Presses page', type: :feature do
  # Capybara Doc - https://www.rubydoc.info/github/jnicklas/capybara/Capybara%2FNode%2FElement%3Asend_keys

  before { visit '/key_presses' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Key Presses')
  end

  it 'presses ALT key' do
    find('#target').send_keys :alt

    expect(page).to have_css('#result', text: 'You entered: ALT')
  end

  it 'presses BACK_SPACE key' do
    find('#target').send_keys :backspace

    expect(page).to have_css('#result', text: 'You entered: BACK_SPACE')
  end
end
