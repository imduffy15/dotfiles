#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils --with-default-names
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

brew install wget --with-iri

brew install jq

brew install homebrew/dupes/grep --with-default-names
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Messes with keychain sshkey agent
# brew install homebrew/dupes/openssh

brew install ack
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install ssh-copy-id
brew install tree
brew install dos2unix
brew install groovy
brew install maven
brew install ios-sim
brew install android-sdk
brew install go

brew caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install google-chrome
brew cask install intellij-idea
brew cask install java
brew cask install flash
brew cask install intel-haxm
brew cask install caffeine
brew cask install charles
brew cask install disk-inventory-x 
brew cask install graphviz
brew cask install packer
brew cask install vagrant
brew cask install terraform
brew cask install slack
brew cask install spotify
brew cask install sublime-text3
brew cask install vlc
brew cask install transmission
brew cask install vmware-fusion
brew cask install virtualbox4330101610
brew cask install virtualbox-extension-pack4330101610

# Remove outdated versions from the cellar.
brew cleanup
