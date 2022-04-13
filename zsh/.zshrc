
source $HOME/.zsh/scripts/defaults.zsh
source $HOME/.zsh/scripts/functions.zsh
source $HOME/.zsh/scripts/alias.zsh
source $HOME/.zsh/scripts/directories.zsh
source $HOME/.zsh/scripts/completion.zsh
source $HOME/.zsh/scripts/git.zsh
source $HOME/.zsh/scripts/z.zsh

# Plugins
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/aliases/aliases.zsh

eval "$(lua $HOME/.zsh/plugins/z.lua/z.lua --init enhanced zsh)"
fpath=($HOME/.zsh/plugins/zsh-completions/src $fpath)


# Starship Prompt
eval "$(starship init zsh)"

