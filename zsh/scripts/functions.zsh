d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -10
  fi
}

# Project File Search
vii() {
    fd -t f | sk --preview='bat --style=numbers --color=always --line-range :500 {}' --prompt="🔍 " | xargs -r nvim
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

acs () {
  alias | rg -i $1
}

# Get KDE Klipper Clipboard History
klip() {
  n=0
  f="I am the placeholder for each line in klipper"
  while [ 1 ]; do
     f="$(qdbus org.kde.klipper /klipper getClipboardHistoryItem $n)"
     if [ -z "$f" ]; then break; fi
     echo "$f"
     n=$((++n))
  done
  unset n
}

