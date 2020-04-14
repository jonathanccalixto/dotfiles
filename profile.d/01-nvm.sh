# Defines nvm path
export NVM_DIR=$HOME/.nvm

# Imports nvm configuration
[[ -f "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"

# Imports nvm completions
[[ -f "$NVM_DIR/bash_completion"]] && source "$NVM_DIR/bash_completion"