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

# Install other binaries
binaries=(
  ack
  ansible
  git
  reattach-to-user-namespace
  tmux
  zsh
  heroku
)

printf "installing binaries..."
brew install ${binaries[@]}

# Clean
brew cleanup

# Install Cask
brew install caskroom/cask/brew-cask

# Install Applications
apps=(
  1password
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
  #nylas-n1
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

# Add to PATH, allowing the use of the 'normal' executable names for gnu utilities
printf "$PATH=$HOME/.rbenv/bin:$(brew --prefix coreutils)/libexec/gnubin:$PATH" >> ~/.zshrc
printf "$(rbenv init -)" >> ~/.zshrc


# Manual steps
# --
# pull all pathogen submodules (vim plugins)
# - cd ~/.dotfiles && git submodule update --init --recursive (may need git submodule update --recursive --remote)
# turn off shortcut for spotlight and change alfred to command + space
# mouse direction
# speed up key repeat, mouse tracking speed, delay until repeat
# check ~/.zshrc, $PATH for repetition as well as any janky characters
# add divvy global shortcut cmd+shift+a, or even better, export then import http://mizage.clarify-it.com/d/nxr9qg
# change text size in iterm
# karabiner, activate just external keyboard (devices tab)
# - caps -> esc
# - left cmd -> left option
# - left option -> left cmd
# - rt cmd -> rt option
# - rt option -> rt cmd
# add ~/.ssh/config file (add to dotfiles?)


# TODO
# add clone of dotfiles, simplify branch to this script? not sure i need it at all other than vim, tmux
# add install of rbenv
#   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
