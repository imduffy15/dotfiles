```
xcode-select --install
sudo xcrun cc
```

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
curl -L https://get.rvm.io | bash -s stable
source ~/.bashrc
rvm install ruby-2.1.6 --with-gcc=clang
rvm use 2.1.6
rvm --default use 2.1.6
gem install berks test-kitchen kitchen-vagrant rubocop foodcritic knife serverspec rspec
```

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.bashrc
nvm install v4.2.1
nvm use 4.2.1
nvm alias default 4.2.1
```

```
brew install python --with-brewed-openssl
pip install virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
virtualenv ~/.virtualenvs/default
source ~/.bashrc
pip install Pygments
pip install python-glanceclient
pip install python-novaclient
pip install python-keystoneclient
```