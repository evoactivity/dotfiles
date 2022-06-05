#!/usr/bin/env fish

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

if not grep -qxF "pyenv init - | source" ~/.config/fish/config.fish
    echo /opt/homebrew/bin/fish >>~/.config/fish/config.fish
end

pyenv install 3.10.4
pyenv global 3.10.4
