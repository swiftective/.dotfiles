function cpt --description 'copy file fullpath'
  readlink -f $argv | copy
end
