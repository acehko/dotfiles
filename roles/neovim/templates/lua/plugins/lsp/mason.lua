local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

local servers = {
  'eslint',
  'lua_ls',
  'solargraph',
  'tsserver'
}

mason.setup({
  max_concurrent_installers = 4,
  log_level = vim.log.levels.INFO
})

mason_lspconfig.setup({
  ensure_installerd = servers,
  automatic_installation = true
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require('plugins.lsp.handlers').on_attach,
    capabilities = require('plugins.lsp.handlers').capabilities,
  }

  server = vim.split(server, '@')[1]

  local ok, conf_opts = pcall(require, 'plugins.lsp.settings.' .. server)
  if ok then
    opts = vim.tbl_deep_extend('force', conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
