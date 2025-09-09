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

