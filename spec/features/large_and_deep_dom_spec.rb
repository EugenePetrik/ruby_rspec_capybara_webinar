# frozen_string_literal: true

RSpec.describe 'Large & Deep DOM page', type: :feature do
  before { visit '/large' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'Large & Deep DOM')
  end

  it 'scrolls to table element' do
    # Executes JavaScript script on the page
    script = 'arguments[0].scrollIntoView();'
    # Finds the element with 'table' tag
    table_element = find(:css, 'table')

    execute_script(script, table_element)
  end
end
