function gstu --wraps='git stash --include-untracked' --description 'alias gstu git stash --include-untracked'
  git stash --include-untracked $argv
        
end
