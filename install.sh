#!/bin/bash

echo Install all AppStore Apps at first!
# no solution to automate AppStore installs
read -p "Press any key to continue... " -n1 -s
echo  '\n'

# Homebrew
echo "Install Homebrew and Cask"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask

# alternative cask versions
brew tap caskroom/versions

# Install OSX CLI
echo "Install OSX CLI"
brew install ack
brew install docker
brew install docker-compose
brew install dockutil
brew install hub
brew install hugo
brew install go
brew install mercurial
brew install npm
brew install trash
brew install sshfs
brew install tree
brew install rbenv
brew install ruby-build
brew install webkit2png
brew install wget

# Install OSX Apps
echo "Install OSX Apps"
brew cask install atom
brew cask install boot2docker
brew cask install coda
brew cask install codebug
brew cask install dropbox
brew cask install evernote
brew cask install kaleidoscope
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install macpass
brew cask install optimal-layout
brew cask install puppet
brew cask install skype
brew cask install sublime-text3
brew cask install terraform
brew cask install transmit
brew cask install transmission
brew cask install tower
brew cask install vagrant
brew cask install virtualbox

# Install QuickLooks plugins
# Source: https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install qlprettypatch
qlmanage -r

# Configure OH-MY-ZSH
echo "Install OH-MY-ZSH"
curl -L http://install.ohmyz.sh | sh

# Configure Ruby
echo "Configure Ruby"
rbenv install 2.1.5
rbenv rehash
rbenv global 2.1.5

# Dockutil
dockutil --remove 'Contacts' --allhomes
dockutil --remove 'Maps' --allhomes
dockutil --remove 'FaceTime' --allhomes
dockutil --remove 'iBooks' --allhomes
dockutil --add '/Users/lampson/Applications' --view grid --display folder --before Downloads
dockutil --add '~/Documents' --view grid --display folder --before Downloads
dockutil --add '/Users/lampson/GitHub' --view grid --display folder --before Downloads
dockutil --add '~/Downloads' --view grid --display folder --replacing Downloads
dockutil --add '/Users/lampson/Applications/Google Chrome.app' --section apps
dockutil --add '/Users/lampson/Applications/Firefox.app' --section apps
dockutil --add '/Users/lampson/Applications/iTerm.app' --section apps
dockutil --add '/Users/lampson/Applications/MacPass.app' --section apps
dockutil --add '/Users/lampson/Applications/Tower.app' --section apps
dockutil --move 'Safari' --after Firefox
dockutil --move 'System Preferences' --after Finder

# Tidy up
brew linkapps
brew cleanup
brew prune
brew cask cleanup
