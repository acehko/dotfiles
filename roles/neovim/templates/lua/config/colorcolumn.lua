-- Colorcolumn

-- Change colorcolumn for current buffer
local function colorcolumn(column)
  if not column then column = -1 end

  vim.opt_local.colorcolumn = tostring(tonumber(column) + 1)
end

-- Commmand to change colorcolumn for current buffer
vim.api.nvim_create_user_command('Column', function(opts) colorcolumn(opts.args) end, {nargs = 1})

-- Default colorcolumn
colorcolumn(-1)
