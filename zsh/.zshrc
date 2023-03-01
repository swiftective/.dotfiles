
fpath+=~/.local/share/zsh/zfunc
source $HOME/.config/zsh/scripts/defaults.zsh
source $HOME/.config/zsh/scripts/functions.zsh
source $HOME/.config/zsh/scripts/alias.zsh
source $HOME/.config/zsh/scripts/completion.zsh

# Plugins
source $HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init --cmd j zsh)"

# zsh syntax highlighting
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold

# Starship Prompt
eval "$(starship init zsh)"

# fnm
fnm () {
  unset -f fnm
  eval "$(fnm env --use-on-cd)"
  fnm "$@"
}

# pnpm
export PNPM_HOME="/home/rv/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
