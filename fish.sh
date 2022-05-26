#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" end || exit; done 2>/dev/null &

# Install Oh My Fish

test -e ~/.local/share/omf
if [[ $? != 0 ]] ; then
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi

# Make Fish default shell
grep -qxF '/opt/homebrew/bin/fish' /etc/shells || sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish

defaults write com.apple.terminal Shell -string '/opt/homebrew/bin/fish'


# Install starship

test -e ~/.config/starship.toml
if [[ $? != 0 ]] ; then
	curl -sS https://starship.rs/install.sh | sh
	grep -qxF 'starship init fish | source' ~/.config/fish/config.fish || echo 'starship init fish | source' >> ~/.config/fish/config.fish
	cd ~/.config/
	ln -s ~/dotfiles/settings/starship.toml starship.toml
fi
