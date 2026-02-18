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
  [[ ! -x "$(which socket)" ]] && sh -c "npm i -g @socketsecurity/cli" # Installs socket

  # alias npm="socket npm"

  [[ ! -x "$(which yarn)" ]] && sh -c "npm i -g yarn@latest" # Installs yarn
  # export PATH="$(yarn global bin):$PATH" # Adds yarn global to $PATH
  # export PATH="$(npm root -g)/npm/bin:$PATH" # Adds npm global to $PATH
else
  echo "NPM not found"
fi