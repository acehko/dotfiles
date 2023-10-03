-- Filetype detection

local neovim = require('neovim')

neovim.filetype({
  extension = {
    ['js.coffee.erb'] = 'coffee',
    ['axlsx'] = 'ruby'
  },
})
