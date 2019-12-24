# frozen_string_literal: true

RSpec.describe 'Forgot Password page', type: :feature do
  before { visit '/forgot_password' }

  it 'checks page title' do
    expect(page).to have_css('h2', text: 'Forgot Password')
  end

  it 'email field should be visible' do
    expect(page).to have_field('E-mail')
  end

  it 'retrieve password button should be visible' do
    within('form#forgot_password') do
      expect(page).to have_button('Retrieve password')
    end
  end

  it 'sends restore password email' do
    user_email = FFaker::Internet.email
    # puts "User email is #{user_email}"

    within('form#forgot_password') do
      fill_in('E-mail', with: user_email)
      click_on('Retrieve password')
    end

    expect(page).to have_current_path('/email_sent')
    expect(page).to have_content('Your e-mail\'s been sent!')
  end
end
