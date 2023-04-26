function open_nvim
  set -l preview 'bat --style=numbers --color=always --line-range :500 {}'
  nvim (fd -t f | sk --preview="$preview" --prompt="🔍"; or echo +q)
end
