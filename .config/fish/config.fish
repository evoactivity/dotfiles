eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx EDITOR code
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx PATH /opt/homebrew/opt/findutils/libexec/gnubin $PATH

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

set -gx PIPX_DEFAULT_PYTHON "$HOME/.pyenv/versions/3.10.4/bin/python"
set -gx PATH $PATH /Users/liam/.local/bin #pipx location

test -e ~/.config/fish/.iterm2_shell_integration.fish; and source ~/.config/fish/.iterm2_shell_integration.fish

test -e ~/.config/fish/.aliases.fish; and source ~/.config/fish/.aliases.fish

# Keep secrets safe from git, this file is created by running the setup-fish.fish script
test -e ~/.config/fish/.secrets.fish; and source ~/.config/fish/.secrets.fish

starship init fish | source
pyenv init - | source
