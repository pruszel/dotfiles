# This file is sourced for login shells (both interactive and non-interactive).
# It is typically used for environment setup that should happen once at login.

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Kiro CLI pre block.
  [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"

  # Initialize Homebrew
  if [ -x "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Kiro CLI post block.
  [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"
fi
