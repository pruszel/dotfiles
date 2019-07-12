set -g -x fish_greeting ''

# Add things to PATH
set -gx PATH $PATH /usr/local/bin/
set -gx PATH $PATH /Users/peter/Library/Python/2.7/bin/

# Load aliases
source ~/.config/.aliases

# Node Version Manager
set -gx NVM_DIR /usr/local/opt/nvm
