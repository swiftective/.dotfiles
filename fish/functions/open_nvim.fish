function open_nvim
  set -l preview 'bat --style=numbers --color=always --line-range :500 {}'
  set -l file (fd -t f | sk --preview="$preview" --prompt="🔍")
  if test -n "$file"
    nvim $file
  end
end
