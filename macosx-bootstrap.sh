#!/bin/sh

# Install Homebrew 
if test ! $(which brew); then
  printf "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew
brew update

# Update Unix Tools
brew install coreutils
brew install findutils
brew install bash
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Add to PATH, allowing the use of the 'normal' executable names for gnu utilities
printf "$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH" >> ~/.bash_profile

# Install other binaries
binaries=(
  ack
  git
	zsh
)

printf "installing binaries..."
brew install ${binaries[@]}

# Clean
brew cleanup

# Install Cask
brew install caskroom/cask/brew-cask

# Install Applications
apps=(
	adium
  alfred
  cyberduck
  dash
  divvy
	dropbox
	evernote
	flux
  google-chrome
	iterm2
	java
  karabiner-elements
  macvim
  private-internet-access
  shimeike-formulatepro
	skype
  skitch
  slack
	spotify
  transmission
	vlc
	vagrant
	virtualbox
)

printf "installing apps..."
brew cask install ${apps[@]}

brew cask cleanup

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
