function mise --description "Startup mise"
  functions -e mise
  mise activate fish | source
  mise $argv
end
