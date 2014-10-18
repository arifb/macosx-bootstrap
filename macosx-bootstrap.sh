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

# Add to PATH
printf "$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH" >> ~/.bash_profile

# Install others binaries
binaries=(
  graphicsmagick
  rename
  ffmpeg
  python3
  sshfs
  git
	detox
	duplicity
	nmap
	openssl
	p7zip
	unrar
	wget
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
	caffeine
  chromium
	citrix-receiver
  crashplan
	dropbox
	evernote
  firefox
  flash
	flux
	iterm2
	keepassx
	libreoffice
	mou
  nvalt
	paragon-ntfs
  qlmarkdown
  qlstephen
  quicklook-json
	skype
	spotify
	sublime-text
	vlc
	vagrant
	virtualbox
)

printf "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask cleanup

# Install Mackup
brew install mackup

# Mackup backup applications config
mackup backup

# Run osx-for-hackers.sh
DIR=$(pwd)
if [ -d ~/git ]
then
  cd ~/git
else
	mkdir ~/git && cd ~/git
fi
git clone https://gist.github.com/e22d9840f9ea2fee4716.git
sh e22d9840f9ea2fee4716/osx-for-hackers.sh

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Install Oh-My-ZSH
curl -L http://install.ohmyz.sh | sh

