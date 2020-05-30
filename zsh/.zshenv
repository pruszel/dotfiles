export EDITOR="vim"
export PATH="$PATH:$HOME/.local/bin"
[ -d "/usr/local/opt/python/libexec/bin" ] && export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Load GitHub command shell completion for zsh
[ -n "$(command -v gh)" ] && eval "$(gh completion -s zsh)"

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
