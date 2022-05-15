
source $HOME/.config/zsh/scripts/defaults.zsh
source $HOME/.config/zsh/scripts/functions.zsh
source $HOME/.config/zsh/scripts/alias.zsh
source $HOME/.config/zsh/scripts/directories.zsh
source $HOME/.config/zsh/scripts/completion.zsh
source $HOME/.config/zsh/scripts/git.zsh
source $HOME/.config/zsh/scripts/z.zsh

# Plugins
source $HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.local/share/zsh/plugins/aliases/aliases.plugin.zsh

eval "$(lua $HOME/.local/share/zsh/plugins/z.lua/z.lua --init enhanced zsh)"
fpath=($HOME/.local/share/zsh/plugins/zsh-completions/src $fpath)

# zsh syntax highlighting
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold

# Starship Prompt
eval "$(starship init zsh)"
