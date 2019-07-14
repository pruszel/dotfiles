# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# Activate vi mode with <Escape>
set -o vi

# cd into directory just by typing directory name
shopt -s autocd

# Set prompt
ARROW='\[$(tput setaf 2)\]➜ '
USER='\[$(tput bold)$(tput setaf 4)\]\u'
DIV='\[$(tput setaf 7)\]:'
DIR='\[$(tput setaf 4)\]\W'
PROMPT='\[$(tput sgr0)\]>'
export PS1="${ARROW} ${USER}${DIV}${DIR} ${PROMPT} "

# The contents of this variable are executed as a regular Bash command just before Bash displays a prompt.
export PROMPT_COMMAND="echo '--'"

# Add timestamp to history
export HISTTIMEFORMAT="%d/%m/%y %T "

# Present a better git status
function gits {
  if [ -d .git ]; then
    # display branch name
    echo -n "On ";
    tput setaf 2; tput smul
    echo $(git rev-parse --abbrev-ref HEAD);
    echo;

    # display git ss (simple status)
    tput sgr0; 
    git ss;
    [ -z "$(git ss)" ] && echo "No changes."
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

