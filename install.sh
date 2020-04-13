project="$HOME/Workspace/github/jonathanccalixto/dotfiles"
dotfiles="$HOME/.dotfiles"

# Imports project
[[ ! -d "$project/.git" ]] && git clone https://github.com/jonathanccalixto/dotfiles.git $project

# Makes shotcut to dotfiles folder in home path
[[ !d $dotfiles ]] && ln -s $project $dotfiles

# Makes shortcut to dotfiles
for original_file in `find ${dotfiles_basedir}/dotfiles.d -maxdepth 1`; do
  file=".`basename $original_file`"
  dotfile="$HOME/$file"

  if [ ! -f $dotfile ]; then
    echo "### Makes shortcut to \033[1;34m$file\033[0;37;00m.";
    ln -snfv $original_file $dotfile
  else
    echo "### Shortcut to \033[1;34m$file\033[0;37;00m already made.";
  fi
done

# Installs zsh
[[ ! -x "$(which zsh)" ]] && sudo apt-get install -y zsh

# Makes a custom git configuration when doesn't exists
[[ ! -f "$project/profile.d/git-custom.sh" ]] && touch "$project/profile.d/git-custom.sh"
