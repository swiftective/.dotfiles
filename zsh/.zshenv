export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export EDITOR='nvim'
export LC_ALL='en_US.UTF-8'
export LANG="en_US.UTF-8"
export VISUAL='nvim'

# export PATH=$PATH:$XDG_DATA_HOME/flutter/bin

export PNPM_HOME="$XDG_DATA_HOME/pnpm"

export BUN_INSTALL="$XDG_DATA_HOME/bun"
export PATH=$PATH:$BUN_INSTALL/bin

export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export PATH=$PATH:$XDG_DATA_HOME/cargo/bin

export PATH="$HOME/.deno/bin:$PATH"

export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export PATH=$JAVA_HOME/bin:$PATH

export ANDROID_SDK_ROOT='$XDG_DATA_HOME/Android/Sdk/'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

# Starship prompt
export STARSHIP_CONFIG=~/.config/starship/init.toml

# vi mode
export KEYTIMEOUT=20

export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_DATA_HOME}/zsh/.zsh_history"
export _ZL_DATA="${XDG_DATA_HOME}/zlua/.zlua"
export ATAC_KEY_BINDINGS=${XDG_CONFIG_HOME}/atac/vim_key_bindings.toml
