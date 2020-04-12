project="$HOME/Workspace/github/jonathanccalixto/dotfiles"
dotfiles="$HOME/.dotfiles"

# Imports project
[[ ! -d "$project/.git" ]] && git clone https://github.com/jonathanccalixto/dotfiles.git $project

# Makes shotcut to dotfiles folder in home path
[[ !d $dotfiles ]] && ln -s $project $dotfiles

