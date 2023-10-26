-- Filetype detection

local neovim = require('neovim')

-- TODO: Not working
neovim.filetype({
  extension = {
    ['lua.j2'] = 'lua',
    ['yaml.j2'] = 'yaml'
  }
})

-- TODO: Workaround for above
neovim.autocmd({'BufRead', 'BufNewFile'}, {pattern = '*.lua.j2', command = 'set filetype=lua'})
neovim.autocmd({'BufRead', 'BufNewFile'}, {pattern = '*.yaml.j2', command = 'set filetype=yaml'})
