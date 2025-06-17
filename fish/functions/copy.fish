function copy --wraps='xclip -sel clip' --description 'alias copy xclip -sel clip'

  if test -n "$WAYLAND_DISPLAY"
    wl-copy $argv
  else
    xclip -sel clip $argv
  end

end
