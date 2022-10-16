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

local lsp_format = require 'lsp-format'
lsp_format.setup()
local lsp_config = require 'lspconfig'

local on_attach = function(client)
  lsp_format.on_attach(client)
end

require 'mason-lspconfig'.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler
    lsp_config[server_name].setup {
      on_attach = on_attach,
    }
  end,
  ['sumneko_lua'] = function()
    lsp_config.sumneko_lua.setup {
      on_attach = on_attach,
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

vim.cmd [[ 
autocmd BufWritePre *.tsx,*.ts,*.js EslintFixAll
]]

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

require 'lsp_signature'.setup()
