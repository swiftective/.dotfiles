if status is-interactive
  set fish_cursor_default     block      blink
  set fish_cursor_insert      line       blink
  set fish_cursor_replace_one underscore blink
  set fish_cursor_visual      block
  bind -M insert ctrl-space accept-autosuggestion
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

zoxide init --cmd j fish | source
