# Defines spaceship theme
export ZSH_THEME="spaceship"

#
# SSH Profile
#
# Current SSH Profile

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SSH_PROFILE_SHOW="${SPACESHIP_SSH_PROFILE_SHOW=false}"
SPACESHIP_SSH_PROFILE_PREFIX="${SPACESHIP_SSH_PROFILE_PREFIX="with ssh "}"
SPACESHIP_SSH_PROFILE_SUFFIX="${SPACESHIP_SSH_PROFILE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX "}"
SPACESHIP_SSH_PROFILE_COLOR="${SPACESHIP_SSH_PROFILE_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_ssh_profile() {
  [[ $SPACESHIP_SSH_PROFILE_SHOW == false ]] && return

  if [ -f $HOME/.ssh_profile ]; then
    ssh_profile=$(cat $HOME/.ssh_profile)
  else
    ssh_profile="Default"  # Nome padrão, se nenhum perfil estiver definido
  fi

  spaceship::section \
    --color "$SPACESHIP_SSH_PROFILE_COLOR" \
    --prefix "$SPACESHIP_SSH_PROFILE_PREFIX" \
    --suffix "$SPACESHIP_SSH_PROFILE_SUFFIX" \
    "$ssh_profile"
}

# Configures spaceship viewer
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  time          # Time stamps section
  dir           # Current directory section
  host          # Hostname section
  ssh_profile   # ssh profile indicator
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR="red"
SPACESHIP_SSH_PROFILE_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "