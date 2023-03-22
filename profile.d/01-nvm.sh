# Defines nvm path
export NVM_DIR="$HOME/.nvm"

# Imports nvm configuration
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Imports nvm completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -f "$PWD/.node-version" ]]; then
  NODE_VERSION=$(cat $PWD/.node-version | sed "s|v||")
elif [[ -f "$PWD/.nvmrc" ]]; then
  NODE_VERSION=$(cat $PWD/.nvmrc | sed "s|v||")
fi

if [[ "$NODE_VERSION" ]]; then
  [[ ! "$(nvm list | grep $NODE_VERSION | cut -d"v" -f2)" ]] && nvm install $NODE_VERSION

  nvm use $NODE_VERSION
else
  echo "node version not found"
fi
