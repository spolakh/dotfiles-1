########################
# Bootstrap script
#
# Will install homebrew to start with and then clone my dotfiles directory
# for further installation and configuration.
#

# Switch to home directory
cd $HOME

# request sudo password upfront and keep the sudo session alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Then; install Homebrew if not already exist.
if ! [ -x "$(command -v brew)" ]; then
  echo "No Homebrew found; Installing homebrew first"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Already have Homebrew; continuing.."
fi

# checkout rest of dotfiles repo before continuing
git clone --bare https://github.com/tmw/dotfiles.git $HOME/.dotfiles

# And then install apps and fonts
./.bootstrap-scripts/install-apps.sh

