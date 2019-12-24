# frozen_string_literal: true

RSpec.describe 'Infinite Scroll page' do
  before { visit '/infinite_scroll' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Infinite Scroll')
  end

  it 'scrolls to bottom five times' do
    script = 'window.scrollTo(0, document.body.scrollHeight)'
    
    5.times { execute_script(script) }
  end
end
