"UltiSnips config

let g:UltiSnipsJumpForwardTrigger  = '<M-M>'                    " Bind CTRL + Enter to jump to the next tabstop
let g:UltiSnipsJumpBackwardTrigger = '<M-CR>'                   " Bind ALT + Enter to jumo to the previous tabstop
let g:UltiSnipsEditSplit           = 'vertical'                 " Open a vertical split when running :UltiSnipsEditSplit
let g:UltiSnipsExpandTrigger       = '<Plug>(ultisnips_expand)' " Trigger keybinding

" Snippets directory
let g:UltiSnipsSnippetDir         = $HOME . '.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [$HOME . '.vim/ultisnips']
