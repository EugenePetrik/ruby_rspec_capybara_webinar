# frozen_string_literal: true

RSpec.describe 'Hovers page', type: :feature do
  before { visit '/hovers' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Hovers')
  end

  it 'hovers to second profile' do
    within(:xpath, '(//div[@class="figure"])[2]') do
      find(:xpath, './/img[@alt="User Avatar"]').hover
      find(:xpath, './/a[contains(text(), "View profile")]').click
    end

    expect(page.current_url).to include('/users/2')
  end
end
