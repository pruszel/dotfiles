# Activate vi mode with <Escape>
set -o vi

# cd into directory just by typing directory name
shopt -s autocd

# Set prompt
export PS1="\\[$(tput setaf 2)\]➜  $(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 7)\]:\[$(tput setaf 4)\]\W \[$(tput sgr0)\]"

