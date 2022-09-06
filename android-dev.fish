#!/usr/bin/env fish

# Install Jabba
echo -------------------------------------
echo 'Enable Jabba - Java Version Manager'
echo -------------------------------------
function brew_install
    if brew list $argv &>/dev/null
        echo "$argv is already installed"
    else
        echo "Installing $argv"
        brew install $argv && echo "$argv is installed"
    end
    echo ''
end

if not test -e ~/.jabba/jabba.fish
    export JABBA_VERSION="0.11.2"
    curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash; and . ~/.jabba/jabba.fish
end

echo -------------------------------------
echo 'Enable openjdk@1.16.0'
echo -------------------------------------
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
brew_install apktool
