# frozen_string_literal: true

RSpec.describe 'The-Internet page', type: :feature do
  before { visit '/' }

  xit 'checks page title with have_title' do
    expect(page).to have_title('The Internet')
  end

  it 'checks page heading with have_content' do
    expect(page).to have_content('Welcome to the-internet')
  end

  it 'checks page heading with have_css' do
    skip 'Not implemented yet'
    expect(page).to have_css('h1', text: 'Welcome to the-internet')
  end

  it 'checks current URL', skip: 'Not implemented yet' do
    expect(page).to have_current_path('https://the-internet.herokuapp.com')
  end
end
