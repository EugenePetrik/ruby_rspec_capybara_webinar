# frozen_string_literal: true

RSpec.describe 'Javascript Console Errors', type: :feature do
  before { visit '/' }

  it 'runs through all the links' do
    all('li a')
      .map { |a| a[:href] }
      .each { |link| visit link }

    # https://the-internet.herokuapp.com/javascript_error
  end
end
