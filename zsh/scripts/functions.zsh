
# notfication made easy
notify() {
  app_name=$1
  shift
  notify-send --app-name="$app_name" "$*"
  unset app_name
}

# Project File Search
vii() {
    fd -t f | sk --preview='bat --style=numbers --color=always --line-range :500 {}' --prompt="🔍 " | xargs -r nvim
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
