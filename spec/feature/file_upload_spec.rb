# frozen_string_literal: true

RSpec.feature 'File Upload page' do
  before { visit '/upload' }

  it 'checks page title' do
    expect(page).to have_css('h3', text: 'File Uploader')
  end

  it 'uploads file' do
    path = File.absolute_path('./spec/support/files/dummy_image.jpeg')

    attach_file('file-upload', path)
    click_on 'Upload'

    expect(page).to have_css('h3', text: 'File Uploaded!')
    expect(page).to have_css('#uploaded-files', text: File.basename(path).to_s)
  end
end
