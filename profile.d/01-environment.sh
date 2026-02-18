# Defines default editor
export EDITOR="/usr/bin/vim"
# export EDITOR="mate -w"

# Defines SO type
if  echo $HOME | grep -q '/home' ; then
  export MY_SO=Linux
elif  echo $HOME | grep -q '/Users' ; then
  export MY_SO=MacOS
elif  echo $HOME | grep -q 'C:' ; then
  export MY_SO=Windows
else
  export MY_SO=Windows
fi

# Defines manpager
export MANPAGER='less -Xr'

if [[ $MY_SO = 'MacOS' ]]; then
  # Defines my executables
  export PATH="/Applications/Docker.app/Contents/Resources/bin/:$PATH"
  export PATH="/usr/local/sbin:$PATH"

  # Homebrew paths - prioritize over system defaults
  # This ensures we use the latest versions of tools like rsync (3.4.1)
  # instead of the outdated built-in versions

  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

  # Verify rsync version after PATH is set
  if command -v rsync &> /dev/null; then
    RSYNC_VERSION=$(rsync --version | head -1)
    # Uncomment next line for debugging:
    # echo "✓ rsync ready: $RSYNC_VERSION"
  fi
fi

export PATH="$HOME/.bin:$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"