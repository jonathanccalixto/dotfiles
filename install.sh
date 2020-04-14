project="$HOME/Workspace/github/jonathanccalixto/dotfiles"
dotfiles="$HOME/.dotfiles"
profiles="$dotfiles/.profile.d"

# Imports project
[[ ! -d "$project/.git" ]] && git clone https://github.com/jonathanccalixto/dotfiles.git $project

# Makes shotcut to dotfiles folder in home path
[[ ! -d $dotfiles ]] && ln -s $project $dotfiles

# Installs zsh
[[ ! -x "$(which zsh)" ]] && sudo apt-get install -y zsh

# Installs oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  [[ ! -x "$(which curl)" ]] && sudo apt-get install -y curl
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Installs spaceship
[[ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]] &&\
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

[[ -f "$ZSH_CUSTOM/themes/spaceship.zsh-theme" ]] &&\
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Makes a custom git configuration when doesn't exists
[[ ! -f "$profiles/02-git-custom.sh" ]] && touch "$project/profile.d/02-git-custom.sh"

# Applies zsh
[[ -z `cat $HOME/.bashrc | grep -i "[[ -x /bin/zsh ]] && /bin/zsh && exit 0"` ]] &&\
  echo "[[ -x /bin/zsh ]] && /bin/zsh && exit 0\n" >> $HOME/.bashrc

# Installs zinit (old zplugin)
[[ ! -d "$HOME/.zinit/bin" ]] &&\
  git clone https://github.com/zdharma/zinit.git $HOME/.zinit/bin

# Applies zsh customization
if [ -f "$HOME/.zshrc" ]; then
  [[ ! -f "$HOME/.zshrc.old" ]] && mv $HOME/.zshrc $HOME/.zshrc.old

  rm -f $HOME/.zshrc
fi

# Installs rbenv
RBENV="$HOME/.rbenv"
if [ ! -d $RBENV ]; then
  # Donwloads project
  git clone https://github.com/rbenv/rbenv.git $RBENV

  # Tries to compile dynamic bash extension to speed up rbenv.
  cd $RBENV && src/configure && make -C src && cd -

  # Defines plugin path
  RPLUGINS="$RBENV/plugins"

  # Adds rbenvs's plugins
  [[ ! -d $RPLUGINS ]] && mkdir -p $RPLUGINS
  [[ ! -d "$RPLUGINS/ruby-build" ]] && git clone https://github.com/rbenv/ruby-build.git "$RPLUGINS/ruby-build"
  # [[ ! -d "$RPLUGINS/default-gems" ]] && git clone https://github.com/rbenv/default-gems.git "$RPLUGINS/default-gems"

  # Verifies that rbenv is properly set up using this rbenv-doctor script
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
fi

# Installs nvm
[[ ! -d "$HOME/.nvm" ]] &&\
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Makes shortcut to dotfiles
for original_file in `find ${dotfiles}/dotfiles.d -maxdepth 1`; do
  file=".`basename $original_file`"
  dotfile="$HOME/$file"

  if [ ! -f $dotfile ]; then
    echo "### Makes shortcut to \033[1;34m$file\033[0;37;00m.";
    ln -snfv $original_file $dotfile
  else
    echo "### Shortcut to \033[1;34m$file\033[0;37;00m already made.";
  fi
done

#  ln -s dotfiles/bin/git-publish-branch bin/
