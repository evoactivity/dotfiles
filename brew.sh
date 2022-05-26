#!/usr/bin/env bash

echo 'Install apps and tools using Homebrew and MAS.'

echo 'Make sure we’re using the latest Homebrew.'
which -s brew
if [[ $? != 0 ]] ; then
    echo 'Install Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

brew_install() {
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        echo "Installing $1"
        brew install $1 && echo "$1 is installed"
    fi
    echo ''
}

echo '------------------------'
echo 'Upgrade any already-installed formulae.'
echo '------------------------'
brew upgrade

# Save Homebrew’s installed location
BREW_PREFIX=$(brew --prefix)

brew tap homebrew/cask-fonts


echo '------------------------'
echo 'Install nerd fonts'
echo '------------------------'
brew_install font-meslo-lg-nerd-font
brew_install font-meslo-for-powerline

echo '------------------------'
echo 'Install GNU core utilities (those that come with macOS are outdated).'
echo 'Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.'
echo '------------------------'
brew_install coreutils
brew_install moreutils
brew_install findutils
brew_install gnu-sed

test -e $BREW_PREFIX/bin/sha256sum
if [[ $? != 0 ]] ; then
    ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
fi

echo '------------------------'
echo 'Install GnuPG to enable PGP-signing commits.'
echo '------------------------'
brew_install gnupg
brew_install gpg-suite
echo '------------------------'
echo 'Install some CLI apps'
echo '------------------------'
brew_install bash
brew_install fish
brew_install iterm2
brew_install nano
brew_install vim
brew_install grep
brew_install screen
brew_install tree
brew_install ssh-copy-id
brew_install wget
echo '------------------------'
echo 'Development Tools'
echo '------------------------'
brew_install visual-studio-code
brew_install docker
brew_install docker-compose
brew_install volta
brew_install git
brew_install git-lfs
echo '------------------------'
echo 'compression'
echo '------------------------'
brew_install p7zip
brew_install pigz
brew_install zopfli
brew_install keka
echo '------------------------'
echo 'Browsers'
echo '------------------------'
brew_install firefox
brew_install google-chrome
echo '------------------------'
echo 'Mac Apps'
echo '------------------------'
brew_install alfred
brew_install spectacle
brew_install contexts
echo '------------------------'
echo 'My Tools'
echo '------------------------'
brew_install private-internet-access
brew_install bitwarden
brew_install syncthing
brew_install fantastical
brew_install adobe-creative-cloud
brew_install figma
echo '------------------------'
echo 'Install video and image related tools'
echo '------------------------'
brew_install imagemagick
brew_install ffmpeg
brew_install kap
brew_install vlc
brew_install mpv
brew_install vips
echo '------------------------'
echo 'Install messaging apps'
echo '------------------------'
brew_install telegram
brew_install discord
brew_install slack
brew_install whatsapp

echo '------------------------'
echo 'Install Mac App Store CLI tool and related apps'
echo '------------------------'
brew_install mas
echo "Install Spark - Email app by readdle"
mas install 1176895641 

echo '------------------------'
echo 'Setup services'
echo '------------------------'
brew services start syncthing

echo ''
echo '------------------------'
echo 'Remove outdated versions from the cellar.'
echo '------------------------'
brew cleanup

