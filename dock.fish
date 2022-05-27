#!/usr/bin/env fish


# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Set the dock to autohide
defaults write com.apple.Dock autohide -bool true

# Set the dock autohide delay to 0
defaults write com.apple.Dock autohide-delay -float 0

dockutil --no-restart --remove all

dockutil --no-restart --add "/Applications/Spark.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Figma.app"

dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"

dockutil --no-restart --add "/Applications/Discord.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/WhatsApp.app"
dockutil --no-restart --add "/Applications/Telegram.app"


dockutil --no-restart --add '' --type spacer --section apps --before "iTerm"
dockutil --no-restart --add '' --type spacer --section apps --after "Figma"
dockutil --no-restart --add '' --type spacer --section apps --after "Google Chrome"
dockutil --no-restart --add '' --type spacer --section apps --after "Telegram"

killall Dock

echo "Success! Dock is set."