# clear olds configurations
echo "" > "$HOME/.gitconfig"

git config --global alias.unstage 'reset HEAD'
git config --global alias.st status
git config --global alias.ci 'commit -S'
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.lg "log --oneline --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lgf "log --name-status --decorate --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git config --global alias.lgp "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -p"
git config --global alias.lga "log --oneline --all --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lgaf "log --name-status --all --decorate --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git config --global alias.lgap "log --oneline --all --decorate --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -p"
git config --global alias.mg merge
git config --global alias.amend "commit -S --amend"

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.diff.meta "blue black bold"

git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore

git config --global credential.helper 'cache --timeout=3600'

git config --global push.default current

git config --global user.name "Your Name Comes Here"
git config --global user.email you@yourdomain.example.com
git config --global user.signingkey "<GPG pub code>"