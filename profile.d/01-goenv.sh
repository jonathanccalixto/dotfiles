# Defines GOENV path
GOENV=$HOME/.goenv

# Imports goenv configuration
if [ -d $GOENV ]; then
  # Adds goenv executables in path
  # export PATH="$PATH:$GOENV/bin"
  # pwd=$PWD

  # Imports goenv completions
  if [ -f "$GOENV/completions/goenv.zsh" ]; then
    source "$GOENV/completions/goenv.zsh"
  fi

  # # Updates goenv
  # cd $GOENV && git pull -q

  # # returns to original path
  # cd $pwd

  export GOENV_ROOT="$GOENV"
  command -v goenv >/dev/null || export PATH="$GOENV/bin:$PATH"
  eval "$($GOENV/bin/goenv init -)"

  autoload -U add-zsh-hook

  _find_go_version_file() {
    local dir="$PWD"
    while [ "$dir" != "/" ]; do
      if [ -f "$dir/.go-version" ]; then
        echo "$dir/.go-version"
        return 0
      fi
      dir=$(dirname "$dir")
    done
    return 1
  }

  load-goversion() {
    local go_version_file
    go_version_file=$(_find_go_version_file)

    if [ -n "$go_version_file" ]; then
      local required_version
      required_version=$(cat "$go_version_file")

      if ! goenv versions --bare 2>/dev/null | grep -qx "$required_version"; then
        echo "Installing Go $required_version via goenv..."
        goenv install "$required_version"
      fi
    fi
  }

  add-zsh-hook chpwd load-goversion
  load-goversion
fi
