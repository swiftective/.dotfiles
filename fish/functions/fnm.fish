function fnm --description "Startup fnm"
  functions -e fnm
  fnm env --use-on-cd | source
  fnm $argv
end
