# Add things to PATH
set -gx PATH $PATH /usr/local/bin/

# Set Node Version Manager directory
export NVM_DIR="$HOME/.nvm"
sh /usr/local/opt/nvm/nvm.sh

# Load aliases
source ~/.config/.aliases

set -g -x fish_greeting ''
