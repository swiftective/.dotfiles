function paste --wraps='xclip -sel clipboard -o' --description 'alias paste=xclip -sel clipboard -o'
  xclip -sel clipboard -o $argv
        
end
