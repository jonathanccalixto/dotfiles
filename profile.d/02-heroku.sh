if [ -x "$(which heroku)" ]; then
  alias hsc="hs run console"
  alias hsdb="hs run rails dbconsole -p"

  alias hhc="hh run console"
  alias hhdb="hh run rails dbconsole -p"

  alias hh2c="hh2 run console"
  alias hh2db="hh2 run rails dbconsole -p"

  alias hpc="hp run console"
  alias hpdb="hp run rails dbconsole -p"

  set-profile() {
    echo -e "\033]50;SetProfile=Default\a"
    vscode_settings="$HOME/Library/Application Support/Code/User/settings.json"

    [[ $1 = 'Default' ]] && rm -f $HOME/.heroku-* | ''

    [[ $1 = '+Production' ]] && touch "$HOME/.heroku-production"
    [[ $1 = '-Production' ]] && rm -f "$HOME/.heroku-production"

    [[ $1 = '+Homolog' ]] && touch "$HOME/.heroku-homolog"
    [[ $1 = '-Homolog' ]] && rm -f "$HOME/.heroku-homolog"

    [[ $1 = '+Sandbox' ]] && touch "$HOME/.heroku-sandbox"
    [[ $1 = '-Sandbox' ]] && rm -f "$HOME/.heroku-sandbox"

    # Clear production Theme
    sed -i -e 's/Brave (rainglow)/Dracula Soft/g' $vscode_settings
    sed -i -e 's/Brave Light (rainglow)/GitHub Plus/g' $vscode_settings

    # Clear homolog Theme
    sed -i -e 's/Banner (rainglow)/Dracula Soft/g' $vscode_settings
    sed -i -e 's/Banner Light (rainglow)/GitHub Plus/g' $vscode_settings

    # Clear sandbox Theme
    sed -i -e 's/Absent (rainglow)/Dracula Soft/g' $vscode_settings
    sed -i -e 's/Absent Light (rainglow)/GitHub Plus/g' $vscode_settings

    if [[ -f "$HOME/.heroku-production" ]]; then
      sed -i -e 's/Dracula Soft/Brave (rainglow)/g' $vscode_settings
      sed -i -e 's/GitHub Plus/Brave Light (rainglow)/g' $vscode_settings
      echo -e "\033]50;SetProfile=Production\a"
    fi

    if [[ -f "$HOME/.heroku-homolog" ]]; then
      sed -i -e 's/Dracula Soft/Absent (rainglow)/g' $vscode_settings
      sed -i -e 's/GitHub Plus/Absent Light (rainglow)/g' $vscode_settings
      echo -e "\033]50;SetProfile=Homolog\a"
    fi

    if [[ -f "$HOME/.heroku-sandbox" ]]; then
      sed -i -e 's/Dracula Soft/Banner (rainglow)/g' $vscode_settings
      sed -i -e 's/GitHub Plus/Banner Light (rainglow)/g' $vscode_settings
      echo -e "\033]50;SetProfile=Sandbox\a"
    fi
  }

  clear-theme() {
    set-profile Default
  }

  dark-theme() {
    vscode_settings="$HOME/Library/Application Support/Code/User/settings.json"

    # default theme
    sed -i -e 's/GitHub Plus/Dracula Soft/g' $vscode_settings

    # production Theme
    sed -i -e 's/Brave Light (rainglow)/Dracula Soft/g' $vscode_settings

    # homolog Theme
    sed -i -e 's/Banner Light (rainglow)/Dracula Soft/g' $vscode_settings

    # sandbox Theme
    sed -i -e 's/Absent Light (rainglow)/Dracula Soft/g' $vscode_settings

    set-profile Dark-Theme
  }

  light-theme() {
    vscode_settings="$HOME/Library/Application Support/Code/User/settings.json"

    # default theme
    sed -i -e 's/Dracula Soft/GitHub Plus/g' $vscode_settings

    # production Theme
    sed -i -e 's/Brave (rainglow)/GitHub Plus/g' $vscode_settings

    # homolog Theme
    sed -i -e 's/Banner (rainglow)/GitHub Plus/g' $vscode_settings

    # sandbox Theme
    sed -i -e 's/Absent (rainglow)/GitHub Plus/g' $vscode_settings

    set-profile Light-Theme
  }

  hs() {
    cmd=$1
    shift
    set-profile +Sandbox
    echo 'sandbox: environment'
    heroku $cmd -r sandbox $*
    set-profile -Sandbox
  }

  hh() {
    cmd=$1
    shift
    set-profile +Homolog
    echo 'homolog: environment'
    heroku $cmd -r homolog $*
    set-profile -Homolog
  }

  hh2() {
    cmd=$1
    shift
    set-profile +Homolog2
    echo 'homolog2: environment'
    heroku $cmd -r homolog2 $*
    set-profile -Homolog2
  }

  hp() {
    cmd=$1
    shift
    set-profile +Production
    echo 'production: environment'
    heroku $cmd -r production $*
    set-profile -Production
  }
fi