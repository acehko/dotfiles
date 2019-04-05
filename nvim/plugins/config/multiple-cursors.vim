" vim-multiple-cursors config

" Custom key bindings
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-m>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Pressing <Esc> does not quit multi cursor mode when in visual or insert mode
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
