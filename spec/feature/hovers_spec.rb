# frozen_string_literal: true

RSpec.feature 'Hovers page' do
  before { visit '/hovers' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Hovers')
  end

  it 'hovers to second profile' do
    within(:xpath, '(//div[@class="figure"])[2]') do
      find('img').hover
      find('a').click
    end

    expect(page.current_url).to include('/users/2')
  end
end
