# Source aliases
[ -f ~/.aliases ] && source "$HOME/.aliases"

# Source OS-specific aliases
[[ "$OSTYPE" == "darwin"* ]] && [ -f ~/.aliases.macos ] && source "$HOME/.aliases.macos"

# Remove TypeScript alias
[[ $(type -t script) == "alias" ]] && unalias script

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
PS1="\n--\n${PS1_ARROW} ${PS1_USER}${PS1_DIV}${PS1_DIR} ${PS1_PROMPT} "

# Store unlimited history
HISTSIZE=
HISTFILESIZE=

# Add timestamp to history
HISTTIMEFORMAT="%F %T "

export EDITOR="vim"
