if [[ $MY_SO = 'MacOS' ] && [ -x "$(which node)" ]]; then
  [[ ! -f "/usr/local/bin/node" ]] && sh -c "ln -sf $(eval which node) /usr/local/bin/node" # linking node to xcode
fi

if [ -x "$(which npm)" ]; then
  [[ ! -x "$(which yarn)" ]] && sh -c "npm install yarn -g; clear" # Installs yarn
  export PATH="$(yarn global bin):$PATH" # Adds yarn global to $PATH
  export PATH="$(npm -g bin):$PATH" # Adds npm global to $PATH
fi