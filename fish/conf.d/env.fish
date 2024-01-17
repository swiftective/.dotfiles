function _init_opam --on-variable PWD
  if test -e .ocamlformat
    functions -e _init_opam
    functions -e opam
    eval (command opam env)
  end
end

_init_opam
