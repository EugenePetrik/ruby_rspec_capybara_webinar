# frozen_string_literal: true

RSpec.describe 'The-Internet page', type: :feature do
  before { visit '/' }

  it 'checks page title with have_title', :smoke do
    expect(page).to have_title('The Internet')
  end

  it 'checks page heading with have_content', :smoke do
    expect(page).to have_content('Welcome to the-internet')
  end

  it 'checks page heading with have_css', :smoke do
    expect(page).to have_css('h1', text: 'Welcome to the-internet')
  end

  it 'checks page subtitle', :smoke do
    expect(page).to have_css('h2', text: 'Available Examples')
  end

  it 'checks current URL' do
    expect(page).to have_current_path('https://the-internet.herokuapp.com')
  end

  it 'checks that link Form Authentication exist' do
    expect(page).to have_link('Form Authentication')
  end

  it 'checks the numner of links' do
    links_size = all('ul li a').size
    expect(links_size).to eq 43
  end

  it 'clicks on the Dropdown link with click_on', :smoke do
    click_on('Dropdown')
    expect(page).to have_current_path('/dropdown')
  end

  it 'finds the link and clicks', :smoke do
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
