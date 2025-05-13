# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# This file is sourced by interactive shells (both login and non-login).
# It is typically used to set up shell prompts, aliases, functions, and other interactive features.

export EDITOR='neovim'
export KEYTIMEOUT=1
export GPG_TTY="$(tty)"

# Load aliases if present
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"

# List directory after changing the current working directory
chpwd() {
  ls -GAhp1
}

# Print emoji based on previous command's exit code
custom_precmd() {
  local exit_status=$?
  if [[ $exit_status -ne 0 ]]; then
    echo '❌'
  else
    echo '✅'
  fi
}

# Enable zsh hooks
autoload -Uz add-zsh-hook
add-zsh-hook precmd custom_precmd

# Customize prompt format
PS1="%F{magenta}%n%F{white}:%F{cyan}%~%f"$'\n'

# cd into directory just by typing its name
setopt autocd
setopt extendedglob

# Enable colors
autoload -U colors && colors

# Configure history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Enable command completion
autoload compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vi mode to edit command line
bindkey -v
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Edit line in EDITOR with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load Oh My Zsh plugins
plugins=(
  git
  zsh-syntax-highlighting
  ssh-agent
  zsh-autosuggestions
)

# Load `z` command used to jump around directories
[ -f /opt/homebrew/etc/profile.d/z.sh ] && source /opt/homebrew/etc/profile.d/z.sh

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
