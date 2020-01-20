RSpec.describe 'Before and after hooks' do
  before(:all) do
    puts 'Runs before all examples'
  end

  after(:all) do
    puts 'Runs after all examples'
  end

  before(:each) do
    puts 'Runs before each example'
  end

  after(:each) do
    puts 'Runs after each example'
  end

  it 'is the first example in this spec file' do
    puts 'Running the first example'
  end

  it 'is the second example in this spec file' do
    puts 'Running the second example'
  end
end
