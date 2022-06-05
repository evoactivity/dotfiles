#!/usr/bin/env fish

# Install Oh My Fish
if not test -e ~/.local/share/omf
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
end

# Make Fish default shell
if not grep -qxF /opt/homebrew/bin/fish /etc/shells
    sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
    chsh -s /opt/homebrew/bin/fish
    defaults write com.apple.terminal Shell -string /opt/homebrew/bin/fish
end

# Install starship
if not test -e ~/.config/starship.toml
    if not which starship
        curl -sS https://starship.rs/install.sh | sh
    end

    if not grep -qxF 'starship init fish | source' ~/.config/fish/config.fish
        echo 'starship init fish | source' >>~/.config/fish/config.fish
    end

    ln -s ~/dotfiles/.config/starship.toml ~/.config/starship.toml
end


if not test -e ~/.config/fish/.secrets.fish
    echo "#!/usr/bin/env fish

# This file is not a symlink and not part of the dotfiles repo, do not commit anywhere!

" >~/.config/fish/.secrets.fish
end
