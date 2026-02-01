function gwa --wraps='git worktree add' --description 'add git worktree'
  # Add the worktree using the first argument
  git worktree add -b $argv[1] .worktrees/$argv[1]
end
