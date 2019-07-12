#!/bin/sh

# Add user scripts to PATH
export PATH="$PATH:/usr/local/bin/"

# Add RVM to PATH. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

# Node Version Manager
export NVM_DIR="/usr/local/opt/nvm"

# Add Python to PATH
export PATH="$PATH:/Users/peter/Library/Python/2.7/bin/"

# Pretty-print `ls`
export CLICOLOR=1
#export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';

# Source .bashrc
echo "$0" | grep "bash$" > /dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Source .aliases
[ -f ~/.aliases ] && source "$HOME/.aliases"

# iTerm2 shell integration utilities
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

