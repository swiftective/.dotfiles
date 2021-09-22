
# Start NVIM Session
vs() {
    if [[ ! -e Session.vim ]]; then
        nvim . -S
    else
        nvim -S
    fi
}

# FZF for changing Directories
cid() {
    cd `fd -H -t d . '/home/rv/' | sk`
}

# Whole System File Search
via() {
    fd -t f -H . '/home/rv/' | sk | xargs -r nvim
}

# Project File Search
vii() {
    fd -t f | sk | xargs -r nvim
}

# Loads NVM
ns() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
}


# git worktree switch
ws (){
  if (git worktree list &> /dev/null); then
    dir=`git worktree list | sk | awk '{print $1}'`
    cd $dir
  else 
    echo "No git repo found !!!"
  fi
  unset dir
}

