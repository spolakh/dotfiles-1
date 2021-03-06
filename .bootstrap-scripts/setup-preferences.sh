# Write Mac OS preferences

# Ensure we have a `development` directory
mkdir ~/Development

##################
# Configure Dock #
##################

# Set dock icon size
#defaults write com.apple.dock tilesize -int 32

# Hide recents section in dock
#defaults write com.apple.dock show-recents -bool false

# Don’t automatically rearrange Spaces based on most recent use
#defaults write com.apple.dock mru-spaces -bool false

# Overide settings file
cp $HOME/.bootstrap-scripts/assets/com.apple.dock.plist ~/Library/Preferences

############
# Keyboard #
############

# Set key repeat preferences
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

############
# Trackpad #
############
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true


##########
# Finder #
##########

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

###########
# Locales #
###########
defaults write NSGlobalDomain AppleLocale -string "en_NL"
defaults write NSGlobalDomain AppleLanguages -array "en-US" "nl-NL"

########
# Misc #
########
# Enable font smoothing on non-Retina displays
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# Kill (restart) all affected applications
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1
done
