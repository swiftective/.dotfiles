function fish_user_key_bindings
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase insert
  bind --preset -M insert -k nul forward-char
  bind -M insert -m default jk backward-char force-repaint
  bind -M insert \ce edit_command_buffer
  bind  -M insert \cj prevd-or-backward-word
  bind  -M insert \ck nextd-or-forward-word
  bind -M insert \co open_nvim
end
