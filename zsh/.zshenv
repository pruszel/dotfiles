# This file is sourced for every instance of the Zsh shell (login, non-login, interactive, non-interactive).
# It is typically used to set up environment variables and other settings that should apply to all shell instances.

# Set location for user-specific configurations
export XDG_CONFIG_HOME="$HOME/.config"

# Opt-out of Homebrew's analytics
export HOMEBREW_NO_ANALYTICS=1

# Add executables in the user's ~/bin directory to PATH
export PATH="$HOME/bin:$PATH"

# Add Sublime Text subl script to PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Add Homebrew-installed executables to PATH
export PATH="$PATH:/usr/local/bin"

# Add JetBrains Toolbox App scripts to PATH
export PATH="$PATH:/Users/pruszel/Library/Application Support/JetBrains/Toolbox/scripts"
