alias g='git'

alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias glog='git log --graph --oneline --decorate'
alias glogp='git log --graph --oneline --decorate -p'
alias gc='git checkout'
alias gce='git commit -e'

alias gw='git worktree'
alias gwl='git worktree list'
alias gwa='git worktree add'
alias gwr='git worktree remove'

alias grs='git restore'

alias gp='git push'
alias gl='git pull'

alias grm='git rm'

alias gsh='git show'
alias gs='git status'

alias gstu='git stash --include-untracked'
alias gstp='git stash pop'
alias gsw='git switch'

alias ..='cd ..'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias ls='exa -a --icons'
alias l='exa --icons'
alias la='exa -al --icons'

alias cat='bat -p'
alias less='bat'
alias vim='nvim'
alias emc='emacsclient -nc'
alias copy='xclip -sel clip'
alias vi='nvim'
alias grep='rg'
alias pacman='pamac'
alias pac='pamac'
alias fdh="fd -H"
alias ta='tmux attach'
alias tksv='tmux kill-server'
alias tl='tmux list-sessions'
alias ts='ns && tmux new'
alias t='tmux'
alias rg='rg -i'
alias open='xdg-open $@ 2> /dev/null'
alias htop='btop'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
