if [ -x "$(which npm)" ]; then
  [[ ! -x "$(which yarn)" ]] && sh -c "npm install yarn -g; clear" # Installs yarn
  export PATH="$(yarn global bin):$PATH" # Adds yarn global to $PATH
  export PATH="$(npm -g bin):$PATH" # Adds npm global to $PATH
fi