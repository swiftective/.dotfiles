function glog --wraps='git log --graph --oneline --decorate' --description 'alias glog git log --graph --oneline --decorate'
  git log --graph --oneline --decorate $argv
        
end
