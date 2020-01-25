# frozen_string_literal: true

RSpec.describe 'Login page', type: :feature do
  before { visit '/login' }

  it 'checks page title' do
    expect(page).to have_css('h2', text: 'Login Page')
  end

  it 'username field should be visible' do
    # Checks for presence of an input field named Username in a form
    expect(page).to have_field('Username')
  end

  it 'password field should be visible' do
    # Checks for presence of an input field named Password in a form
    expect(page).to have_field('Password')
  end

  it 'login button should be visible' do
    # Checks for presence of a button named Login
    expect(page).to have_button('Login')
  end

  it 'logs in with correct credentials' do
    # Finds element by label Username and fills 'tomsmith' value
    fill_in('Username', with: 'tomsmith')
    # Finds element by label Password and fills 'SuperSecretPassword' value
    fill_in('Password', with: 'SuperSecretPassword!')
    click_button('Login')

    # Using id instead of label
    # fill_in('username', with: 'tomsmith')
    # fill_in('password', with: 'SuperSecretPassword!')

    success_message = 'You logged into a secure area!'
    expect(page).to have_content(success_message)
    expect(page).to have_current_path('/secure')
    expect(page).to have_css('h2', text: 'Secure Area')
    expect(page).to have_css('a i', text: 'Logout')
  end

  it 'can not log in with incorrect username' do
    fill_in('Username', with: 'tomsmith_test')
    fill_in('Password', with: 'SuperSecretPassword!')
    click_button('Login')

    error_message = 'Your username is invalid!'
    expect(page).to have_content(error_message)
  end

  it 'can not log in with incorrect password' do
    fill_in('Username', with: 'tomsmith')
    fill_in('Password', with: 'TestSuperSecretPassword!')
    click_button('Login')

    error_message = 'Your password is invalid!'
    expect(page).to have_css('div.flash', text: error_message)
  end
end
