eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx EDITOR code
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx PATH /opt/homebrew/opt/findutils/libexec/gnubin $PATH

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

test -e ~/.config/fish/.iterm2_shell_integration.fish; and source ~/.config/fish/.iterm2_shell_integration.fish

test -e ~/.config/fish/aliases.fish; and source ~/.config/fish/aliases.fish

# Keep secrets safe from git, this file is created by running the fish.sh script
test -e ~/.config/fish/secrets.fish; and source ~/.config/fish/secrets.fish

starship init fish | source
