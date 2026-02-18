# Node 24+ does not include npm by default, it needs to be enabled via corepack
# This script checks the Node version and enables corepack if needed

# Get Node major version
get_node_major_version() {
  if [[ -x "$(which node)" ]]; then
    node -v | sed 's/v\([0-9]*\).*/\1/'
  else
    echo "0"
  fi
}

# Enable corepack and npm for Node 24+
enable_corepack_if_needed() {
  local node_major=$(get_node_major_version)

  if [[ "$node_major" -ge 24 ]]; then
    if [[ -x "$(which corepack)" ]]; then
      # Enable corepack (manages npm, yarn, pnpm)
      corepack enable 2>/dev/null

      # Activate npm if not available
      if [[ ! -x "$(which npm)" ]]; then
        corepack prepare npm@latest --activate 2>/dev/null
      fi

      # Activate yarn if not available
      if [[ ! -x "$(which yarn)" ]]; then
        corepack prepare yarn@stable --activate 2>/dev/null
      fi
    fi
  fi
}

# Run corepack activation for Node 24+
enable_corepack_if_needed

# Continue with npm-based installations
if [[ -x "$(which npm)" ]]; then
  # Install global packages (only if not already installed)
  [[ ! -x "$(which claude)" ]] && npm i -g @anthropic-ai/claude-code 2>/dev/null
  [[ ! -x "$(which socket)" ]] && npm i -g @socketsecurity/cli 2>/dev/null
  [[ ! -x "$(which eas)" ]] && npm i -g eas-cli@latest 2>/dev/null

  # For Node < 24, install yarn via npm if needed
  _node_major=$(get_node_major_version)
  if [[ "$_node_major" -lt 24 ]]; then
    [[ ! -x "$(which yarn)" ]] && npm i -g yarn@latest 2>/dev/null
  fi
  unset _node_major
fi
