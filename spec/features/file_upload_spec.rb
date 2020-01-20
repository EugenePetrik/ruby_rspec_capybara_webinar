# frozen_string_literal: true

RSpec.describe 'File Upload page', type: :feature do
  before { visit '/upload' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'File Uploader')
  end

  it 'uploads file' do
    # The path to the file
    path = File.absolute_path('./spec/support/files/dummy_image.jpeg')
    # Get file name
    image_text = File.basename(path).to_s

    attach_file('file-upload', path)
    click_on('Upload')

    expect(page).to have_css('h3', text: 'File Uploaded!')
    expect(page).to have_css('#uploaded-files', text: image_text)
  end
end
