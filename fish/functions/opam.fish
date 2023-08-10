function opam --description "Startup opam"
  functions -e opam
  eval (opam env)
  opam $argv
end
