# Defines PYENV path
PYENV=$HOME/.pyenv

# Imports pyenv configuration
if [ -d $PYENV ]; then
  # Adds pyenv executables in path
  # export PATH="$PATH:$PYENV/bin"
  # pwd=$PWD

  # Imports pyenv completions
  if [ -f "$PYENV/completions/pyenv.zsh" ]; then
    source "$PYENV/completions/pyenv.zsh"
  fi

  # # Updates pyenv
  # cd $PYENV && git pull -q

  # # Updates plugins
  # for plugin in `find "$PYENV/plugins" -maxdepth 1`; do
  #   [[ -d "$plugin/."git ]] && cd $plugin && git pull -q
  # done

  # # returns to original path
  # cd $pwd

  command -v pyenv >/dev/null || export PATH="$PYENV/bin:$PATH"
  eval "$($PYENV/bin/pyenv init -)"
fi