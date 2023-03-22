if [[ $MY_SO -eq 'MacOS' ]]; then
  if [[ -x "$(which node)" ]]; then
    [[ ! -f "/usr/local/bin/node" ]] && sh -c "ln -sf $(eval which node) /usr/local/bin/node" # linking node to xcode
  fi
fi

if [[ -x "$(which npm)" ]]; then
  [[ ! -x "$(which socket)" ]] && sh -c "npm i -g @socketsecurity/cli" # Installs socket

  # alias npm="socket npm"

  [[ ! -x "$(which yarn)" ]] && sh -c "npm i -g yarn@latest" # Installs yarn
  # export PATH="$(yarn global bin):$PATH" # Adds yarn global to $PATH
  # export PATH="$(npm root -g)/npm/bin:$PATH" # Adds npm global to $PATH
else
  echo "NPM not found"
fi