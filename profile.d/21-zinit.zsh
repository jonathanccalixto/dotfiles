# Added by Zinit's installer
source "$HOME/.zinit/bin/zinit.zsh"

# Loads Zinit configurations
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Installs Zinit plugins
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light buonomo/yarn-completion