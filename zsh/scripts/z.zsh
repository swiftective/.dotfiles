eval "$(lua $HOME/.zsh/plugins/z.lua/z.lua --init enhanced zsh)"

alias jr='z -r'
alias jt='z -t'
alias jl='z -l'
alias je='z -e'
alias ji='z -I'

j() {
    _zlua $@
    printf '\e[1;31m%s\n\e[0m' "$(pwd)"
}


jb() {
    _zlua -b $@
    printf '\e[1;31m%s\n\e[0m' "${PWD##*/}"
}

jc() {
    _zlua -c $@
    printf '\e[1;31m%s\n\e[0m' "$(pwd)"
}

