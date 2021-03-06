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
  ctags
  git
  heroku
  htop
  postgresql
  reattach-to-user-namespace
  tldr
  tmux
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
  1password
  adium
  cyberduck
  divvy
  dropbox
  evernote
  firefox
  flux
  google-chrome
  gpgtools
  handbrake
  insomnia
  iterm2
  java
  karabiner-elements
  licecap
  macvim
  nylas-mail
  postico
  private-internet-access
  retini
  shimeike-formulatepro
  skype
  skitch
  slack
  spotify
  teamviewer
  toggldesktop
  transmission
  twist
  typora
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
printf "export PATH=$HOME/.rbenv/bin:$(brew --prefix coreutils)/libexec/gnubin:$PATH" >> ~/.zshrc
printf "eval \"$(rbenv init -)\"" >> ~/.zshrc


# Manual steps
# --
# brew cask will install alfred v3 which i don't have license for, download alfred 2 
# - https://cachefly.alfredapp.com/Alfred_2.8.4_437.zip
# - https://www.alfredforum.com/topic/995-find-folder-%E2%80%94%C2%A0search-by-folder-name-workflow/
# - turn off shortcut for spotlight and change alfred to command + space
# brew cask will install arq v5 which i don't have license for, download arq 4
# - https://www.arqbackup.com/arq4/
# brew cask will install dash v3 or v4 which i don't have license, download dash 2
# - https://kapeli.com/downloads/v2/Dash.zip
# download office (see 1password)
# download lightroom via adobe site
# download inconsolata-g, use otf, for vim http://www.fantascienza.net/leonardo/ar/inconsolatag/inconsolata-g_font.zip
# pull all pathogen submodules (vim plugins)
# - cd ~/.dotfiles && git submodule update --init --recursive (may need git submodule update --recursive --remote)
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
# add install of rbenv, ruby-build
#   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
#   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
#   rbenv install 2.4.0
