# frozen_string_literal: true

# If you are not using Rails, tag all the example groups
# in which you want to use Capybara with "type: :feature"
# https://github.com/teamcapybara/capybara#using-capybara-with-rspec

RSpec.describe 'The-Internet page', type: :feature do
  before { visit '/' }

  it 'checks page title with have_title' do
    expect(page).to have_title('The Internet')
  end

  it 'checks page heading with have_content' do
    expect(page).to have_content('Welcome to the-internet')
  end

  it 'checks page heading with have_css' do
    expect(page).to have_css('h1', text: 'Welcome to the-internet')
  end

  it 'checks page subtitle' do
    expect(page).to have_css('h2', text: 'Available Examples')
  end

  it 'checks current URL' do
    expect(page).to have_current_path('https://the-internet.herokuapp.com')
  end

  it 'checks that link Form Authentication exist' do
    expect(page).to have_link('Form Authentication')
  end

  it 'checks the numner of links' do
    links = all('ul li a')
    expect(links.size).to eq 43
  end

  it 'clicks on the Form Authentication link with click_link' do
    click_link('Form Authentication')
    expect(page).to have_current_path('/login')
  end

  it 'clicks on the Dropdown link with click_on' do
    # This method allows clicking on a Link or Button
    click_on('Dropdown')
    expect(page).to have_current_path('/dropdown')
  end

  it 'finds the link and clicks' do
    # To click on a button, use find_button('button_text').click
    # To click on a button, use find_button(value: '1234').click
    find_link('Dynamic Loading').click
    expect(page).to have_current_path('/dynamic_loading')
  end

  it 'finds the link and gets text' do
    get_link_text = find_link('Forgot Password').text
    expect(get_link_text).to eq 'Forgot Password'
  end

  it 'finds the link and gets the href attribute' do
    get_href_attr = find_link('JavaScript onload event error')[:href]
    expect(get_href_attr).to eq 'https://the-internet.herokuapp.com/javascript_error'
  end
end
