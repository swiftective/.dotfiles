function open_nvim
  set -l preview 'bat --style=numbers --color=always --line-range :500 {}'
  fd -t f | sk --preview="$preview" --prompt="🔍" | xargs -r nvim
end
