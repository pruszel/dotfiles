# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Ignore these extensions for tab completion
fignore=(DS_Store localized)

# Source aliases
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"

export HOMEBREW_NO_ANALYTICS=1
export KEYTIMEOUT=1

export AWS_PROFILE=marketing

export GPG_TTY="$(tty)"

# red dots will be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# cd into directory just by typing its name
setopt autocd

setopt extendedglob

# Enable colors
autoload -U colors && colors

# Set prompt
NEWLINE=$'\n'
PS1="${NEWLINE}%(?.🤙.‼️)%f${NEWLINE}%B%{$fg[red]%}%{$fg[yellow]%}%n%{$fg[green]%}@%m:%{$fg[magenta]%}%~%{$fg[red]%}%{$reset_color%} $ %b"

# History
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt histignorealldups

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

# Move to start of line
#bindkey '^a' vi-beginning-of-line

# Load NVM (Node.js version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load RVM (ruby version manager)
[[ -a "/Users/pruszel/.rvm/scripts/rvm" ]] && source "/Users/pruszel/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# z - jump around command
source /opt/homebrew/etc/profile.d/z.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
