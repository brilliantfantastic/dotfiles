autoload -U promptinit
promptinit
autoload -U compinit promptinit
compinit
promptinit

setopt prompt_subst
autoload -U colors && colors
promptinit

autoload -Uz vcs_info
 
zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{blue}]'
  } else {
      zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{red}●%F{blue}]'
    }
  vcs_info
 }
  
setopt prompt_subst
PROMPT=' %F{blue}%1d%{$reset_color%}${vcs_info_msg_0_}%F{blue}%(?/%F{blue}/%F{red})%{$reset_color%} %% '




# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 


alias nginx='sudo /opt/nginx/sbin/nginx'
alias ss='script/server'
alias sc='script/console'
alias gc='git commit'
alias gco='git checkout'
alias ge='git commit -am "Quick commit, nothing to see here."' # Git commit - needs to be refactored to allow a message to be passed
alias gs='git status'
alias gc='git commit -am'
alias gb='git branch'
alias gl='git log'
alias cs='cap staging deploy'
alias gps='git push github staging'
alias gp='git pull'
alias gc='git checkout'
alias rs='rails server'
alias be='bundle exec'


# Nginx
alias nginxconf='sudo vim /opt/nginx/conf/nginx.conf'


# Postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'

# Watch the Rails development log
alias dl='tail -f log/development.log'

# Cd into Rev site directory, set up ruby, rails, and start mysql 
# alias rev='cd ~/FormFx/rev;rvm use 1.8.7-p334;rvm gemset use rev;mysql.server start'
# alias rvm-rev='rvm use 1.8.7-p334@rev'