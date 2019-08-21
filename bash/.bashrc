# Source aliases
[ -f ~/.aliases ] && source "$HOME/.aliases"

# Source OS-specific aliases
[[ "$OSTYPE" == "darwin"* ]] && [ -f ~/.aliases.macos ] && source "$HOME/.aliases.macos"

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# Handy variables
# export DIRNAME="$(basename $PWD)"
# Number of files in current directory
# export FILECOUNT="$(find . -type f | wc -l)"

# Activate vi mode with <Escape>
set -o vi

# cd into directory just by typing directory name
shopt -s autocd

# Set prompt
PS1_ARROW='\[$(tput setaf 2)\]➜ '
PS1_USER='\[$(tput bold)$(tput setaf 4)\]\u'
PS1_DIV='\[$(tput setaf 7)\]:'
PS1_DIR='\[$(tput setaf 4)\]\W'
PS1_PROMPT='\[$(tput sgr0)\]>'
PS1="--\n${PS1_ARROW} ${PS1_USER}${PS1_DIV}${PS1_DIR} ${PS1_PROMPT} "

# Store unlimited history
HISTSIZE=
HISTFILESIZE=

# Add timestamp to history
HISTTIMEFORMAT="%F %T "

export EDITOR="vim"

# Present a better git status
function gits {
  gitdir="$(git rev-parse --show-toplevel)"
  if [ -n $gitdir ]; then
    # display branch name
    echo -n "On ";
    tput setaf 2; tput smul;
    echo $(git rev-parse --abbrev-ref HEAD);
    echo;

    # display simple git status
    tput sgr0;
    git status -s;
    [ -z "$(git status -s)" ] && echo "No changes."
  else
    tput setaf 1;
    echo "Not a git repo."
    tput sgr0;
  fi
}
export -f gits

function cat {
  if [ -x "$(command -v ccat)" ];
  then
    ccat "$@"
  else
    cat "$@"
  fi
}
export -f cat

# Connect to pre-defined servers
#function server {
  
#}
#export -f server

