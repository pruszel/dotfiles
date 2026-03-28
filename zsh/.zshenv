# This file is sourced for every instance of the Zsh shell (login, non-login, interactive, non-interactive).
# It is typically used to set up environment variables and other settings that should apply to all shell instances.

# Set location for user-specific configurations
export XDG_CONFIG_HOME="$HOME/.config"

# Add executables in the user's ~/bin directory to PATH
export PATH="$HOME/bin:$PATH"

# Add JetBrains Toolbox App scripts to PATH (cross-platform paths)
if [[ -d "$HOME/Library/Application Support/JetBrains/Toolbox/scripts" ]]; then
  export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
elif [[ -d "$HOME/.local/share/JetBrains/Toolbox/scripts" ]]; then
  export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  export HOMEBREW_NO_ANALYTICS=1

  # Add Sublime Text subl script to PATH
  if [[ -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin" ]]; then
    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
  fi

  # Add Homebrew-installed executables to PATH
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH:/usr/local/bin"
fi

# Load machine-specific env if present
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"
