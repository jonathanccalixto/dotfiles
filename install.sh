#!/bin/bash

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

project="$HOME/Workspace/github/jonathanccalixto/dotfiles"
dotfiles="$HOME/.dotfiles"
profiles="$dotfiles/.profile.d"

# Updates dependencies
if [ $MY_SO = 'Linux' ]; then
  echo "\033[0;32m## Updating \033[1;34mall package\033[0;37;00m"
  sudo apt update
  sudo apt upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean -y
  echo "\033[0;32m## \033[1;34mpackage\033[0;32m updated\033[0;37;00m"
fi

if [ $MY_SO = 'Linux' ]; then
  # Installs build-essential
  if [ -z `dpkg --list | grep build-essential` ]; then
    echo "\033[0;32m## Installing \033[1;34mbuild-essential\033[0;37;00m"
    sudo apt install -y build-essential
  fi
  echo "\033[0;32m## \033[1;34mbuild-essential\033[0;32m installed\033[0;37;00m"
elif [ $MY_SO = 'MacOS' ]; then
  # Installs build-essential
  if [ ! -d "/usr/local/Cellar" ]; then
    echo "\033[0;32m## Installing \033[1;34mhomebrew\033[0;37;00m"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install wget htop
  fi
  echo "\033[0;32m## \033[1;34mhomebrew\033[0;32m installed\033[0;37;00m"
fi

# Installs git
if [ $MY_SO = 'Linux' ]; then
  if [ -z `dpkg --list | grep git` ]; then
    echo "\033[0;32m## Installing \033[1;34mgit\033[0;37;00m"
    sudo apt install -y git
  fi
  echo  "\033[0;32m## \033[1;34mgit\033[0;32m installed\033[0;37;00m"
elif [ $MY_SO = 'MacOS' ]; then
  # Installs build-essential
  if [ ! -x "$(which git)" ]; then
    echo "\033[0;32m## Installing \033[1;34mgit\033[0;37;00m"
    brew install git
  fi
  echo  "\033[0;32m## \033[1;34mgit\033[0;32m installed\033[0;37;00m"
fi

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
if [ $MY_SO = 'Linux' ]; then
  if [ ! -x "$(which zsh)" ]; then
    echo "\033[0;32m## Installing \033[1;34mzsh\033[0;37;00m"
    sudo apt install -y zsh
  fi
  echo "\033[0;32m## \033[1;34mzsh\033[0;32m installed\033[0;37;00m"
fi


# Installs oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  if [ $MY_SO = 'Linux' ]; then
    if [ ! -x "$(which curl)" ]; then
      echo "\033[0;32m#### Installing \033[1;34mcurl\033[0;37;00m"
      sudo apt install -y curl
    fi
    echo "\033[0;32m#### \033[1;34mcurl\033[0;32m installed\033[0;37;00m"
  fi

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
  echo "\nif [ -x /bin/zsh ]; then\n  /bin/zsh && exit 0\nfi" >> $HOME/.bashrc
fi
echo "\033[0;32m## \033[1;34mzsh\033[0;32m setted on \033[1;34m$HOME/.bashrc\033[0;37;00m"

# Installs zinit (old zplugin)
if [ ! -d "$HOME/.zinit/bin" ]; then
  # READ https://z-shell.pages.dev/docs/getting_started/installation
  echo "\033[0;32m## Importing \033[1;34mZinit\033[0;32m project\033[0;37;00m"
  git clone https://github.com/zdharma-continuum/zinit.git $HOME/.zinit/bin
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

  # Verifies that rbenv is properly set up using this rbenv-doctor script
  echo "\033[0;32m## Checking \033[1;34mrbenv\033[0;32m status\033[0;37;00m"
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
  echo "\033[0;32m## \033[1;34mrbenv\033[0;32m cheked\033[0;37;00m"
fi
echo "\033[0;32m## \033[1;34mrbenv\033[0;32m installed\033[0;37;00m"

# Installs pyenv
PYENV="$HOME/.pyenv"
if [ ! -d $PYENV ]; then
  # Donwloads project
  echo "\033[0;32m## Importing \033[1;py\033[0;32m project\033[0;37;00m"
  git clone https://github.com/pyenv/pyenv.git $PYENV
  echo "\033[0;32m## \033[1;34mpyenv\033[0;32m imported\033[0;37;00m"

  # Tries to compile dynamic bash extension to speed up pyenv.
  echo "\033[0;32m## Configuring \033[1;34mpyenv\033[0;32m\033[0;37;00m"
  cd $PYENV && src/configure && make -C src && cd -
  echo "\033[0;32m## \033[1;34mpyenv\033[0;32m configured\033[0;37;00m"

  # Defines plugin path
  PPLUGINS="$PYENV/plugins"

  # Adds pyenvs's plugins
  if [ ! -d $PPLUGINS ]; then
    mkdir -p $PPLUGINS
  fi

  if [ -d "$PPLUGINS/python-build" ]; then
  echo "\033[0;32m## Importing \033[1;34mpython-build\033[0;32m project\033[0;37;00m"
    ./install.sh
  fi
  echo "\033[0;32m## \033[1;34mpython-build\033[0;32m imported\033[0;37;00m"

  # Verifies that pyenv is properly set up using this pyenv-doctor script
  echo "\033[0;32m## Checking \033[1;34mpyenv\033[0;32m status\033[0;37;00m"
  git clone https://github.com/pyenv/pyenv-doctor.git "$PPLUGINS/pyenv-doctor"
  pyenv doctor
  echo "\033[0;32m## \033[1;34mpyenv\033[0;32m cheked\033[0;37;00m"
fi
echo "\033[0;32m## \033[1;34mpyenv\033[0;32m installed\033[0;37;00m"

# Installs ruby and python dependencies
if [ $MY_SO = 'Linux' ]; then
  if [ -z `dpkg --list | grep libxml2-dev` ]; then
    echo "\033[0;32m## Installing \033[1;34mruby and python dependencies\033[0;37;00m"
    sudo apt install -y libbz2-dev libcurl4-openssl-dev libffi-dev liblzma-dev \
                        libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev \
                        libxml2-dev libxml2-dev libxmlsec1-dev libxslt1-dev \
                        libyaml-dev software-properties-common tk-dev xz-utils \
                        zlib1g-dev
  fi
  echo "\033[0;32m## \033[1;34mruby and python dependencies\033[0;32m installed\033[0;37;00m"
elif [ $MY_SO = 'MacOS' ]; then
  if [ -z `brew list | grep libxml2` ]; then
    echo "\033[0;32m## Installing \033[1;34mruby and python dependencies\033[0;37;00m"
    brew install coreutils libxml2 libyaml openssl qt readline sqlite3 tcl-tk xz zlib
  fi
  echo "\033[0;32m## \033[1;34mruby and python dependencies\033[0;32m installed\033[0;37;00m"
fi

# Installs nvm
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  echo "\033[0;32m## Installing \033[1;34mnvm\033[0;32m\033[0;37;00m"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi
echo "\033[0;32m## \033[1;34mnvm\033[0;32m installed\033[0;37;00m"

# Installs docker
if [ $MY_SO = 'Linux' ]; then
  if [ ! -x `which docker` ]; then
    # Donwloads project
    echo "\033[0;32m## Installing \033[1;34mdocker dependecies\033[0;37;00m"
    sudo apt install -y apt-transport-https  ca-certificates\
                        curl  gnupg-agent  software-properties-common
    echo "\033[0;32m## \033[1;34mdocker dependencies\033[0;32m installed\033[0;37;00m"

    echo "\033[0;32m## Adding \033[1;34mdocker gpg key\033[0;37;00m"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -f -
    sudo apt-key fingerprint 0EBFCD88
    echo "\033[0;32m## \033[1;34mdocker gpg key\033[0;32m added\033[0;37;00m"

    echo "\033[0;32m## Adding \033[1;34mdocker respository\033[0;37;00m"
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    echo "\033[0;32m## \033[1;34mdocker respository\033[0;32m added\033[0;37;00m"

    echo "\033[0;32m## Installing \033[1;34mdocker\033[0;37;00m"
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    echo "\033[0;32m## \033[1;34mdocker\033[0;32m installed\033[0;37;00m"

    echo "\033[0;32m## Configuring \033[1;34mdocker user\033[0;37;00m"
    sudo usermod -aG docker $USER
    echo "\033[0;32m## \033[1;34mdocker user\033[0;32m configured\033[0;37;00m"
  fi
  echo "\033[0;32m## \033[1;34mdocker\033[0;32m installed\033[0;37;00m"

  # Installs docker-compose
  echo "\033[0;32m## Installing \033[1;34mdocker-compose\033[0;37;00m"
  if [ ! -x `which docker` ]; then
    echo "\033[0;32m## Downloading \033[1;34mdocker-compose\033[0;37;00m"
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    echo "\033[0;32m## \033[1;34mdocker-compose\033[0;32m downloaded\033[0;37;00m"

    echo "\033[0;32m## Configuring permission for \033[1;34mdocker-compose\033[0;37;00m"
    sudo chmod +x /usr/local/bin/docker-compose
    echo "\033[0;32m## \033[1;34mdocker-compose\033[0;32m persmissions configured\033[0;37;00m"

    echo "\033[0;32m## Linking \033[1;34mdocker-compose\033[0;37;00m"
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    echo "\033[0;32m## \033[1;34mdocker-compose\033[0;32m linked\033[0;37;00m"
  fi
  echo "\033[0;32m## \033[1;34mdocker\033[0;32m installed\033[0;37;00m"

  # Installs docker-machine
  echo "\033[0;32m## Installing \033[1;34mdocker-machine\033[0;37;00m"
  if [ ! -x `which docker` ]; then
    echo "\033[0;32m## Making \033[1;34mdocker-machine\033[0;32m base variable\033[0;37;00m"
    base=https://github.com/docker/machine/releases/download/v0.16.2
    echo "\033[0;32m## \033[1;34mdocker-machine\033[0;32m variable made\033[0;37;00m"

    echo "\033[0;32m## Downloading \033[1;34mdocker-machine\033[0;37;00m"
    sudo curl -L "$base/docker-machine-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-machine
    echo "\033[0;32m## \033[1;34mdocker-machine\033[0;32m downloaded\033[0;37;00m"

    echo "\033[0;32m## Configuring permission for \033[1;34mdocker-machine\033[0;37;00m"
    sudo chmod +x /usr/local/bin/docker-machine
    echo "\033[0;32m## \033[1;34mdocker-machine\033[0;32m persmissions configured\033[0;37;00m"

    echo "\033[0;32m## Linking \033[1;34mdocker-machine\033[0;37;00m"
    sudo ln -s /usr/local/bin/docker-machine /usr/bin/docker-machine
    echo "\033[0;32m## \033[1;34mdocker-machine\033[0;32m linked\033[0;37;00m"
  fi
  echo "\033[0;32m## \033[1;34mdocker-machine\033[0;32m installed\033[0;37;00m"
fi

# Installs gpg
if [ $MY_SO = "MacOS" ]; then
  if [ -z `brew list | grep gpg` ]; then
  echo "\033[0;32m## Installing \033[1;34mGPG\033[0;37;00m"
    brew install gpg2 gnupg pinentry-mac
  fi
  echo "\033[0;32m## \033[1;34mGPG\033[0;32m installed\033[0;37;00m"
fi

# Installs java
if [ $MY_SO = 'Linux' ]; then
  if [ ! -d /usr/lib/jvm/java-8-openjdk-amd64 ]; then
    echo "\033[0;32m## Installing \033[1;34mjava 8\033[0;37;00m"
    sudo apt install -y openjdk-8-jdk
  fi
  echo "\033[0;32m## \033[1;34mjava 8\033[0;32m installed\033[0;37;00m"
fi

# Installs graphic libs
if [ $MY_SO = 'Linux' ]; then
  if [ -z `dpkg --list | grep gcc-multilib` ]; then
    echo "\033[0;32m## Installing \033[1;34mAndroid graphic libs\033[0;37;00m"
    sudo apt install -y gcc-multilib lib32z1 lib32stdc++6
  fi
  echo "\033[0;32m## \033[1;34mAndroid graphic libs\033[0;32m installed\033[0;37;00m"
fi

echo "" > $dotfiles/dotfiles.d/gitconfig
echo "\033[0;32m## \033[1;34mgitconfig\033[0;32m made\033[0;37;00m"

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

# Performs zsh on finish instalation
/bin/zsh && exit 0