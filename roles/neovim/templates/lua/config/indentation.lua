-- Indentation

local neovim = require('neovim')
local opts = {noremap = true, silent = true}

-- Better autoindent
neovim.option('smartindent', true)

-- Show tab guides
neovim.option('listchars', {
  tab = '| ',
  trail = '·'
})

-- Keep lines selected when changing indentation
neovim.keymap('v', '<', '<gv', opts)
neovim.keymap('v', '>', '>gv', opts)

-- Change indentation for current buffer
local function indent(width, guides)
  if guides == nil then guides = true end

  vim.b.indent_width = width

  if width == 'tabs' then
    vim.opt.list = guides
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4

    neovim.command('silent! IndentLinesDisable')
  else
    width = tonumber(width)

    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = width
    vim.opt_local.softtabstop = width
    vim.opt_local.shiftwidth = width

    if guides then
      neovim.command('silent! IndentLinesReset')
    else
      neovim.command('silent! IndentLinesDisable')
    end
  end
end

-- Commmand to change indentation for current buffer
neovim.user_command('Indent', function(opts) indent(opts.args) end, {nargs = 1})

-- Default indentation
neovim.autocmd(
  'BufEnter',
  {
    pattern = '*',
    callback = function()
      if not vim.b.indent_width then
        indent(2) end
      end
  }
)
