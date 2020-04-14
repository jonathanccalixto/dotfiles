# Defines RBENV path
RBENV=$HOME/.rbenv

# Imports rbenv configuration
if [ -d $RBENV ]: then
  # Adds rbenv executables in path
  export PATH="$RBENV/bin:$PATH"

  # Imports rbenv completions
  [[ -f "$RBENV/completions/rbenv.zsh"]] && source "$RBENV/completions/rbenv.zsh"

  # Updates rbenv
  cd $RBENV; git pull -q; cd -

  # Updates plugins
  for plugin in `find $RBENV - maxdepth 1`; do
    cd $plugin; git pull -q; cd -
  done

  eval "$(rbenv iniy -t)"
fi