function jc --description 'Jump to child directory'
  set -l dir (fd -t d | sk)
  if test -n "$dir"
    cd $dir
  end
end
