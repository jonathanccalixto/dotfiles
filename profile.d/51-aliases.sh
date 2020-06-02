alias grep="grep --color"
alias egrep="egrep --color"
alias less="less -Xr"

alias tailf="tail -f"
alias l="ls -h"
alias la="ls -ah"
alias ll="ls -lash"
alias ls="ls -Gh"

# secure your moviments and commands
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# vagrant comands
alias vr="vagrant reload"
alias vu="vagrant up"
alias vs="vagrant ssh"
alias vh="vagrant halt"
alias vd="vagrant destroy -f"

#rails 2 aliases
alias sa="script/autospec"
alias ss="script/server"
alias sc="script/console"
alias r="rails"

#bundle aliases
alias bi="bundle install"
alias bu="bundle update"
alias bx="bundle exec"
alias bo="bundle open"
alias br="bundle exec rails"
alias bs="bundle exec rspec"
alias rk="bundle exec rake"
alias bw="bundle show"

#servers start
alias postgresql_start="postgres -D /usr/local/var/postgres"
alias redis_start="redis-server /usr/local/etc/redis.conf"
alias mysql_start="mysql.server start"

# docker
alias dps="docker ps"
alias dpsi="docker images"
alias dl="docker logs"
alias drma='docker rm -f $(docker ps -aq)'
alias drmia='docker rmi -f $(docker images -aq)'
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dcps="docker-compose ps"
alias dcl="docker-compose logs"
alias dcr="docker-compose run"

# vpn
alias hpn="sudo openvpn --config ~/.vpnconfig/hmg.ovpn"
alias ppn="sudo openvpn --config ~/.vpnconfig/prod.ovpn"
