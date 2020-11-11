if [ -x "$(which heroku)" ]; then
  alias hpc="hp run console"
  alias hsc="hs run console"

  set-profile() {
    echo -e "\033]50;SetProfile=$1\a"
    vscode_settings="$HOME/Library/Application Support/Code/User/settings.json"

    [[ $1 = '+Staging' ]] && touch "$HOME/.heroku-staging"
    [[ $1 = '-Staging' ]] && rm "$HOME/.heroku-staging"
    [[ $1 = '+Production' ]] && touch "$HOME/.heroku-production"
    [[ $1 = '-Production' ]] && rm "$HOME/.heroku-production"
    [[ $1 = 'Default' ]] && rm "$HOME/.heroku-*"

    sed -i -e 's/Brave (rainglow)/Dracula Soft/g' $vscode_settings
    sed -i -e 's/Brave Light (rainglow)/GitHub Plus/g' $vscode_settings
    sed -i -e 's/Banner (rainglow)/Dracula Soft/g' $vscode_settings
    sed -i -e 's/Banner Light (rainglow)/GitHub Plus/g' $vscode_settings

    if [[ -f "$HOME/.heroku-production" ]]; then
      sed -i -e 's/Dracula Soft/Brave (rainglow)/g' $vscode_settings
      sed -i -e 's/GitHub Plus/Brave Light (rainglow)/g' $vscode_settings
    fi

    if [[ -f "$HOME/.heroku-staging" ]]; then
      sed -i -e 's/Dracula Soft/Banner (rainglow)/g' $vscode_settings
      sed -i -e 's/GitHub Plus/Banner Light (rainglow)/g' $vscode_settings
    fi
  }

  hs() {
    cmd=$1
    shift
    set-profile +Staging; echo 'staging: environment'; heroku $cmd -r staging $*; set-profile -Staging
  }

  hp() {
    cmd=$1
    shift
    set-profile +Production; echo 'production: environment'; heroku $cmd -r production $*; set-profile -Production
  }
fi