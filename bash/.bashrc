# Activate vi mode with <Escape>
set -o vi

# cd into directory just by typing directory name
shopt -s autocd

# Set prompt
export PS1="\\[$(tput setaf 2)\]➜  $(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 7)\]:\[$(tput setaf 4)\]\W \[$(tput sgr0)\]> "

# Add timestamp to history
export HISTTIMEFORMAT="%d/%m/%y %T "

# Present a better git status
function gits {
  # display branch name
  echo -n "On ";
  tput setaf 2; tput smul;
  echo $(git rev-parse --abbrev-ref HEAD);
  echo;

  # display git ss (simple status)
  tput sgr0; 
  git ss;
  [ -z "$(git ss)" ] && echo -n "No changes."
}

export -f gits
