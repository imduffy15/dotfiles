#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select --install
sudo xcrun cc

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`
brew install findutils --with-default-names
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install grep --with-default-names

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew install jq

# Install other useful binaries.
brew install git
brew install ssh-copy-id
brew install tree
brew install go
brew install sbt
brew install scala
brew install python --with-brewed-openssl
brew install python3 --with-brewed-openssl
pip install virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
virtualenv  --system-site-packages -p /usr/local/bin/python3 ~/.virtualenvs/default
source ~/.bashrc

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install google-chrome
brew cask install intellij-idea
brew cask install java
brew cask install flash
brew cask install caffeine
brew cask install slack
brew cask install spotify
brew cask install sublime-text3
brew cask install vlc

# Remove outdated versions from the cellar.
brew cleanup
