# Defines nvm path
export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  # Imports nvm configuration
  \. "$NVM_DIR/nvm.sh"  # This loads nvm

  # Imports nvm completion
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Autoload node version
  autoload -U add-zsh-hook

  load-nvmrc() {
    if [[ -f "$PWD/.node-version" ]]; then
      NODE_VERSION=$(cat $PWD/.node-version | sed "s|v||")
    elif [[ -f "$PWD/.nvmrc" ]]; then
      NODE_VERSION=$(cat $PWD/.nvmrc | sed "s|v||")
    fi

    echo "version found: [$NODE_VERSION]"

    if [[ "$NODE_VERSION" ]]; then
      [[ ! "$(nvm list | grep $NODE_VERSION | cut -d"v" -f2)" ]] && nvm install $NODE_VERSION

      nvm use $NODE_VERSION
    else
      nvm install --lts
      echo "node version not found, install --lts"
    fi
  }

  add-zsh-hook chpwd load-nvmrc
  load-nvmrc

  ## nvm-autoload-version
  # if [ -x "$(which npm)" ]; then
  #   autoload -U add-zsh-hook
  #   load-nvmrc() {
  #     local node_version="$(nvm version)"
  #     local nvmrc_path="$(nvm_find_nvmrc)"

  #     echo $nvmrc_path

  #     if [ -n "$nvmrc_path" ]; then
  #       local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

  #       if [ "$nvmrc_node_version" = "N/A" ]; then
  #         nvm install
  #       elif [ "$nvmrc_node_version" != "$node_version" ]; then
  #         nvm use
  #       fi
  #     elif [ "$node_version" != "$(nvm version default)" ]; then
  #       echo "Reverting to nvm default version"
  #       nvm use default
  #     fi
  #   }
  #   add-zsh-hook chpwd load-nvmrc
  #   load-nvmrc && clear
  # fi
fi
