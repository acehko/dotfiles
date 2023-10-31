-- Indentation

local opts = {noremap = true, silent = true}

-- Better autoindent
vim.opt.smartindent = true

-- Show tab guides
vim.optlistchars = {
  tab = '| ',
  trail = '·'
}

-- Keep lines selected when changing indentation
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

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

    vim.cmd('silent! IndentLinesDisable')
  else
    width = tonumber(width)

    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = width
    vim.opt_local.softtabstop = width
    vim.opt_local.shiftwidth = width

    if guides then
      vim.cmd('silent! IndentLinesReset')
    else
      vim.cmd('silent! IndentLinesDisable')
    end
  end
end

-- Commmand to change indentation for current buffer
vim.api.nvim_create_user_command('Indent', function(opts) indent(opts.args) end, {nargs = 1})

-- Default indentation
vim.api.nvim_create_autocmd(
  'BufEnter',
  {
    pattern = '*',
    callback = function()
      if not vim.b.indent_width then
        indent(2) end
      end
  }
)
