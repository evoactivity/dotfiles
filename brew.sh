#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install GNU Parallel
brew install parallel
# Install a modern version of Bash.
brew install bash
# Install a Fish shell.
brew install fish
# Install iTerm2
brew install iterm2



# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
brew install gpg-suite

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen


# Install other useful binaries.
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install zopfli
brew install keka
brew install ssh-copy-id
brew install tree

brew install bitwarden
brew install syncthing
brew install docker
brew install docker-compose
brew install adobe-creative-cloud
brew install private-internet-access
brew install alfred
brew install virtualbox
brew install visual-studio-code
brew install firefox
brew install google-chrome
brew install contexts
brew install figma
brew install spectacle
brew install volta


# Install video related tools
brew install ffmpeg
brew install kap
brew install vlc
brew install mpv

# Install messaging apps
brew install telegram
brew install discord
brew install slack
brew install whatsapp

# Remove outdated versions from the cellar.
brew cleanup
