function paste --wraps='xclip -sel clipboard -o' --description 'alias paste=xclip -sel clipboard -o'

  if test -n "$WAYLAND_DISPLAY"
    wl-paste $argv
  else
    xclip -sel clipboard -o $argv
  end

end
