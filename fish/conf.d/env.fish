function _init_rtx --on-variable PWD
  if test -e .rtx.toml
    functions -e _init_rtx
    functions -e rtx
    command rtx activate fish | source
  end
end

function _init_opam --on-variable PWD
  if test -e .ocamlformat
    functions -e _init_opam
    functions -e opam
    eval (command opam env)
  end
end

_init_opam
_init_rtx
