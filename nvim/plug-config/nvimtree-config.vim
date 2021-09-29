let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_groutrue = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_refresh_wait = 20
let g:nvim_tree_window_picker_exclude = {
      \   'filetype': [
        \     'notify',
        \     'packer',
        \     'qf'
        \   ],
        \   'buftype': [
          \     'terminal'
          \   ]
          \ }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }
let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'symlink': '',
      \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
          \   'arrow_open': "",
          \   'arrow_closed': "",
          \   'default': "",
          \   'open': "",
          \   'empty': "",
          \   'empty_open': "",
          \   'symlink': "",
          \   'symlink_open': "",
          \   },
          \   'lsp': {
            \     'hint': "",
            \     'info': "",
            \     'warning': "",
            \     'error': "",
            \   }
            \ }

set termguicolors


lua require('nvimtree-config')
