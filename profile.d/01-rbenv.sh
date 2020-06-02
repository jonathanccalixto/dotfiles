# Defines RBENV path
RBENV=$HOME/.rbenv

# Imports rbenv configuration
if [ -d $RBENV ]; then
  # Adds rbenv executables in path
  export PATH="$PATH:$RBENV/bin"
  # pwd=$PWD

  # # Imports rbenv completions
  # if [ -f "$RBENV/completions/rbenv.zsh" ]; then
  #   source "$RBENV/completions/rbenv.zsh"
  # fi

  # # Updates rbenv
  # cd $RBENV && git pull -q

  # # Updates plugins
  # for plugin in `find "$RBENV/plugins" -maxdepth 1`; do
  #   [[ -d "$plugin/."git ]] && cd $plugin && git pull -q
  # done

  # # returns to original path
  # cd $pwd

  eval "$(rbenv init -)"
fi