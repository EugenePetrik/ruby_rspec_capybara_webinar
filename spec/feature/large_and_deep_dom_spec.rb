# frozen_string_literal: true

RSpec.feature 'Large & Deep DOM page' do
  before { visit '/large' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Large & Deep DOM')
  end

  it 'scrolls to table element' do
    script = 'arguments[0].scrollIntoView();'
    table_element = find(:css, 'table')

    execute_script(script, table_element)
  end
end
