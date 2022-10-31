# clear olds configurations
echo "" > "$HOME/.gitconfig"

git config --global alias.unstage 'reset'
git config --global alias.st status
git config --global alias.ci 'commit'
git config --global alias.amend "commit --amend"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.lg   "log --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lgf  "log --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --name-status"
git config --global alias.lgp  "log --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -p"
git config --global alias.lga  "log --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
git config --global alias.lgaf "log --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all --name-status"
git config --global alias.lgap "log --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all -p"
git config --global alias.mg merge

git config --global init.defaultBranch main

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.diff.meta "blue black bold"

git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore

git config --global credential.helper 'cache --timeout=3600'

git config --global push.default current

# git config --global user.name "Your Name Comes Here"
# git config --global user.email you@yourdomain.example.com

# git config --global user.signingkey "<GPG pub code>"
# git config --global commit.gpgSign true
# git config --global gpg.program gpg

# git config --global pull.rebase true

# git config --global alias.ci 'commit -S'
# git config --global alias.amend "commit -S --amend"