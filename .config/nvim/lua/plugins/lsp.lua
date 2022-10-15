require('mason').setup()
require 'mason-lspconfig'.setup({
  ensure_installed = {
    'prettier',
    'kotlin_language_server',
    'yaml-language-server',
    'rescript-lsp',
    'prisma-language-server',
    'html-lsp',
    'css-lsp',
    'graphql-language-service-cli',
    'json-lsp',
    'tailwindcss-language-server',
    'eslint-lsp',
    'typescript-language-server',
    'lua-language-server',
  },
  automatic_installation = true,
})

local lspConfig = require 'lspconfig'

require 'mason-lspconfig'.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler
    lspConfig[server_name].setup {}
  end,
  ['sumneko_lua'] = function()
    lspConfig.sumneko_lua.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  end,
}
local null_ls = require 'null-ls'
local mnls = require 'mason-null-ls'
mnls.setup({
  ensure_installed = { 'prettier', 'eslint' }
})

mnls.setup_handlers {
  function() end,
  prettier = function()
    null_ls.register(null_ls.builtins.formatting.prettier)
  end
}

null_ls.setup()

-- nls.setup({
--   sources = {
--     nls.builtins.formatting.prettier,
--     -- nls.builtins.code_actions.eslint,
--   }
-- })
