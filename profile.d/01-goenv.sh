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
fi
