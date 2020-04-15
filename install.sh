#!/bin/bash

project="$HOME/Workspace/github/jonathanccalixto/dotfiles"
dotfiles="$HOME/.dotfiles"
profiles="$dotfiles/.profile.d"

# Installs git
if [ ! -x "$(which git)" ]; then
  echo "\033[0;32m## Installing \033[1;34mgit\033[0;37;00m"
  sudo apt-get install -y git
fi
echo "\033[0;32m## \033[1;34mgit\033[0;32m installed\033[0;37;00m"

# Imports project
if [ ! -d "$project/.git" ]; then
  echo "\033[0;32m## Importing \033[1;34mdotfiles\033[0;32m project\033[0;37;00m"
  git clone https://github.com/jonathanccalixto/dotfiles.git $project
fi
echo "\033[0;32m## \033[1;34mdotfiles\033[0;32m imported\033[0;37;00m"

# Makes shotcut to dotfiles folder in home path
if [ ! -d $dotfiles ]; then
  echo "\033[0;32m## Linking \033[1;34mdotfiles\033[0;32m on \033[1;34m$HOME\033[0;37;00m"
  ln -snfv $project $dotfiles
fi
echo "\033[0;32m## \033[1;34mdotfiles\033[0;32m linked on \033[1;34m$HOME\033[0;37;00m"

# Installs zsh
if [ ! -x "$(which zsh)" ]; then
  echo "\033[0;32m## Installing \033[1;34mzsh\033[0;37;00m"
  sudo apt-get install -y zsh
fi
echo "\033[0;32m## \033[1;34mzsh\033[0;32m installed\033[0;37;00m"

# Installs oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  if [ ! -x "$(which curl)" ]; then
    echo "\033[0;32m#### Installing \033[1;34mcurl\033[0;37;00m"
    sudo apt-get install -y curl
  fi
  echo "\033[0;32m#### \033[1;34mcurl\033[0;32m installed\033[0;37;00m"

  echo "\033[0;32m## Installing \033[1;34m.oh-my-zsh\033[0;37;00m"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
echo "\033[0;32m## \033[1;34m.oh-my-zsh\033[0;32m installed\033[0;37;00m"

# Installs spaceship theme
ZSH_THEMES="$HOME/.oh-my-zsh/custom/themes"
if [ ! -d "$ZSH_THEMES/spaceship-prompt" ]; then
  echo "\033[0;32m## Importing \033[1;34mspaceship theme\033[0;32m project\033[0;37;00m"
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_THEMES/spaceship-prompt"
fi
echo "\033[0;32m## \033[1;34mspaceship theme\033[0;32m imported\033[0;37;00m"

# Configures spaceship theme
if [ ! -f "$ZSH_THEMES/spaceship.zsh-theme" ]; then
  echo "\033[0;32m## Linking \033[1;34mspaceship theme\033[0;32m on \033[1;34m$ZSH_THEMES\033[0;37;00m"
  ln -snfv "$ZSH_THEMES/spaceship-prompt/spaceship.zsh-theme" "$ZSH_THEMES/spaceship.zsh-theme"
fi
echo "\033[0;32m## \033[1;34mspaceship theme\033[0;32m linked on \033[1;34m$ZSH_THEMES\033[0;37;00m"

# Applies zsh
bash_applied=$(grep -i "if \[ -x /bin/zsh \]; then" $HOME/.bashrc)
if [ -z "$bash_applied" ]; then
  echo "\033[0;32m## Setting \033[1;34mzsh\033[0;32m on \033[1;34m$HOME/.bashrc\033[0;37;00m"
  echo "\nif [ -x /bin/zsh ]; then\n  . /bin/zsh\ && exit 0\nfi" >> $HOME/.bashrc
fi
echo "\033[0;32m## \033[1;34mzsh\033[0;32m setted on \033[1;34m$HOME/.bashrc\033[0;37;00m"

# Installs zinit (old zplugin)
if [ ! -d "$HOME/.zinit/bin" ]; then
  echo "\033[0;32m## Importing \033[1;34mZinit\033[0;32m project\033[0;37;00m"
  git clone https://github.com/zdharma/zinit.git $HOME/.zinit/bin
fi
echo "\033[0;32m## \033[1;34mZinit\033[0;32m imported\033[0;37;00m"

# makes zshrc backup
zshrc=$HOME/.zshrc
if [ -f "$zshrc" ]; then
  echo "\033[0;32m## Making \033[1;34mzshrc\033[0;32m backup\033[0;37;00m"
  if [ ! -f "$zshrc.pre" ]; then
    mv "$zshrc" "$zshrc.pre"
  else
    mv "$zshrc" "$zshrc.pre-$(date)"
  fi
fi
echo "\033[0;32m## Backup of \033[1;34mzshrc\033[0;32m made\033[0;37;00m"

# Installs rbenv
RBENV="$HOME/.rbenv"
if [ ! -d $RBENV ]; then
  # Donwloads project
  echo "\033[0;32m## Importing \033[1;34mrbenv\033[0;32m project\033[0;37;00m"
  git clone https://github.com/rbenv/rbenv.git $RBENV
  echo "\033[0;32m## \033[1;34mrbenv\033[0;32m imported\033[0;37;00m"

  # Tries to compile dynamic bash extension to speed up rbenv.
  echo "\033[0;32m## Configuring \033[1;34mrbenv\033[0;32m\033[0;37;00m"
  cd $RBENV && src/configure && make -C src && cd -
  echo "\033[0;32m## \033[1;34mrbenv\033[0;32m configured\033[0;37;00m"

  # Defines plugin path
  RPLUGINS="$RBENV/plugins"

  # Adds rbenvs's plugins
  if [ ! -d $RPLUGINS ]; then
    mkdir -p $RPLUGINS
  fi

  if [ ! -d "$RPLUGINS/ruby-build" ]; then
  echo "\033[0;32m## Importing \033[1;34mruby-build\033[0;32m project\033[0;37;00m"
    git clone https://github.com/rbenv/ruby-build.git "$RPLUGINS/ruby-build"
  fi
  echo "\033[0;32m## \033[1;34mruby-build\033[0;32m imported\033[0;37;00m"

  # if [ ! -d "$RPLUGINS/default-gems" ]; then
  # echo "\033[0;32m## Importing \033[1;34mdefault-gems\033[0;32m project\033[0;37;00m"
  #   git clone https://github.com/rbenv/default-gems.git "$RPLUGINS/default-gems"
  # fi
  # echo "\033[0;32m## \033[1;34mdefault-gems\033[0;32m imported\033[0;37;00m"

  # Verifies that rbenv is properly set up using this rbenv-doctor script
  echo "\033[0;32m## Checking \033[1;34mrbenv\033[0;32m status\033[0;37;00m"
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
  echo "\033[0;32m## \033[1;34mrbenv\033[0;32m cheked\033[0;37;00m"
fi
echo "\033[0;32m## \033[1;34mrbenv\033[0;32m installed\033[0;37;00m"

# Installs nvm
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  echo "\033[0;32m## Installing \033[1;34mnvm\033[0;32m\033[0;37;00m"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi
echo "\033[0;32m## \033[1;34mnvm\033[0;32m installed\033[0;37;00m"

# Makes shortcut to dotfiles
for original_file in `find $dotfiles/dotfiles.d/* -maxdepth 1 | sort`; do
  file=".`basename $original_file`"
  dotfile="$HOME/$file"

  if [ ! -f $dotfile ]; then
    echo "### Makes link to \033[1;34m$file\033[0;37;00m.";
    ln -snfv $original_file $dotfile
  else
    echo "### Link to \033[1;34m$file\033[0;37;00m already made.";
  fi
done

#  ln -snfv dotfiles/bin/git-publish-branch bin/