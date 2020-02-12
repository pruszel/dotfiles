export DOTFILES="$HOME/dotfiles"
export EDITOR="vim"
export HOMEBREW_NO_ANALYTICS=1
export KEYTIMEOUT=1

# Enable colors
autoload -U colors && colors

# Set prompt
PS1_ARROW='\[$(tput setaf 2)\]➜ '
PS1_USER='\[$(tput bold)$(tput setaf 4)\]\u'
PS1_DIV='\[$(tput setaf 7)\]:'
PS1_DIR='\[$(tput setaf 4)\]\W'
PS1_PROMPT='\[$(tput sgr0)\]>'
PS1="\n--\n${PS1_ARROW} ${PS1_USER}${PS1_DIV}${PS1_DIR} ${PS1_PROMPT} "
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# red dots will be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Source aliases
[ -f ~/.config/.aliases ] && source "$HOME/.config/.aliases"

# Load zsh-syntax-highlighting; should be last.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
