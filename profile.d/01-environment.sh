# Defines default editor
export EDITOR="/bin/vim"
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

# Defines my executables
export PATH="$HOME/.bin:$HOME/bin:$PATH"
# export PATH="$HOME:$PATH"