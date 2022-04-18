
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export EDITOR='nvim'
export LC_ALL=en_US.UTF-8
export LANG="en_US.UTF-8"
export VISUAL='nvim'
export MANPAGER="sh -c 'col -bx | bat --theme TwoDark -l man -p'"

# export TERM="xterm-256color"

export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:$HOME/workspace/flutter/bin

export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export PATH=$JAVA_HOME/bin:$PATH

export ANDROID_SDK_ROOT='$HOME/Android/Sdk/'
# export ANDROID_HOME='$HOME/Android/Sdk/'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

# Starship prompt
export STARSHIP_CONFIG=~/.config/starship/init.toml

# vj mode
export KEYTIMEOUT=20


# NPM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
