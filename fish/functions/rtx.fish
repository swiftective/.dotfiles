function rtx --description "Startup rtx"
  functions -e rtx
  rtx activate fish | source
  rtx $argv
end
