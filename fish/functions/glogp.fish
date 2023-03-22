function glogp --wraps='git log --graph --oneline --decorate -p' --description 'alias glogp git log --graph --oneline --decorate -p'
  git log --graph --oneline --decorate -p $argv
        
end
