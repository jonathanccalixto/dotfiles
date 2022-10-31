if [[ $MY_SO = 'MacOS' ]]; then
  # export ruby_configure_flags="--with-readline-dir=$(brew info readline | grep -i cellar | cut -d ' ' -f 1)" &
  export ruby_configure_flags="--with-readline-dir=$($(which ruby) -e "puts  Dir['/usr/local/Cellar/readline/*'].sort.last")"
elif [[ $MY_SO = 'Linux' ]]; then
  export ruby_configure_flags="--with-readline-dir=/usr/include/readline"
fi
