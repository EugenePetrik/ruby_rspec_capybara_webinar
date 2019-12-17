## Ruby + RSpec + Capybara

#### Install Chromedriver on Ubuntu

```wget -N http://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip -P ~/```

```unzip ~/chromedriver_linux64.zip -d ~/```

```rm ~/chromedriver_linux64.zip```

```sudo mv -f ~/chromedriver /usr/local/bin/chromedriver```

```sudo chown root:root /usr/local/bin/chromedriver```

```sudo chmod 0755 /usr/local/bin/chromedriver```

#### Install Chromedriver on Mac via Homebrew

```brew cask install chromedriver```

#### Install Geckodriver on Ubuntu

```wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz```

```sudo sh -c 'tar -x geckodriver -zf geckodriver-v0.26.0-linux64.tar.gz -O > /usr/bin/geckodriver'```

```sudo chmod +x /usr/bin/geckodriver```

```rm geckodriver-v0.26.0-linux64.tar.gz```

#### Install Geckodriver on Mac via Homebrew

```brew install geckodriver```

#### Install bundler

```gem install bundler```

#### Install gems

```bundle install```

#### Run Rubocop

```rubocop```

#### Run Rubocop with auto refactoring

```rubocop -a```

#### Setup RSpec

```rspec --init```
