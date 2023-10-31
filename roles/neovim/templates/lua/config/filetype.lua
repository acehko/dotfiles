-- Filetype detection

-- TODO: Not working
vim.filetype.add({
  extension = {
    ['lua.j2'] = 'lua',
    ['yaml.j2'] = 'yaml'
  }
})

-- TODO: Workaround for above
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {pattern = '*.lua.j2', command = 'set filetype=lua'})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {pattern = '*.yaml.j2', command = 'set filetype=yaml'})
