#!/usr/bin/env fish

# Install Jabba

function brew_install
    if brew list $1 &>/dev/null
        echo "$1 is already installed"
    else
        echo "Installing $1"
        brew install $1 && echo "$1 is installed"
    end
    echo ''
end

if not test -e ~/.jabba/jabba.fish
    export JABBA_VERSION="0.11.2"
    curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash; and . ~/.jabba/jabba.fish
end

jabba install openjdk@1.16.0
jabba use openjdk@1.16.0


echo ------------------------
echo 'Android Dev Tools'
echo ------------------------
brew_install android-platform-tools
brew_install android-studio
brew_install maven
brew_install gradle
brew_install android-sdk
brew_install android-ndk
android update sdk --no-ui
