## Ruby + RSpec + Capybara

#### Install Chromedriver on Ubuntu

```shell
wget -N http://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip -P ~/
```

```shell
unzip ~/chromedriver_linux64.zip -d ~/
```

```shell
rm ~/chromedriver_linux64.zip
```

```shell
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
```

```shell
sudo chown root:root /usr/local/bin/chromedriver
```

```shell
sudo chmod 0755 /usr/local/bin/chromedriver
```

#### Install Chromedriver on Mac via Homebrew

```shell
brew cask install chromedriver
```

#### Install Geckodriver on Ubuntu

```shell
wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
```

```shell
sudo sh -c 'tar -x geckodriver -zf geckodriver-v0.26.0-linux64.tar.gz -O > /usr/bin/geckodriver'
```

```shell
sudo chmod +x /usr/bin/geckodriver
```

```shell
rm geckodriver-v0.26.0-linux64.tar.gz
```

#### Install Geckodriver on Mac via Homebrew

```shell
brew install geckodriver
```

#### Install rvm Ubuntu

[Ubuntu rvm](https://github.com/rvm/ubuntu_rvm)

#### Install rvm Mac

[Mac rvm](https://null-byte.wonderhowto.com/how-to/mac-for-hackers-install-rvm-maintain-ruby-environments-macos-0174401/)

#### Install Ruby 2.6.5

```shell
rvm install 2.6.5
```

```shell
rvm --default use 2.6.5
```

```shell
rvm list
```

```shell
ruby -v
```

#### Install bundler

```shell
gem install bundler
```

#### Install gems

```shell
bundle install
```

#### Run Rubocop

```shell
rubocop
```

#### Run Rubocop with auto refactoring

```shell
rubocop -a
```

#### Setup RSpec

```shell
rspec --init
```

#### Run all spec files

```shell
rspec spec/feature/
```

#### Run specific spec file

```shell
rspec spec/feature/welcome_page_spec.rb
```

#### Run specific test

```shell
rspec spec/feature/key_presses_spec.rb:18
```
