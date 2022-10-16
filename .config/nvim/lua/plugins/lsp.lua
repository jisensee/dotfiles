require 'mason'.setup()

require 'mason-lspconfig'.setup {
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
}

local lsp_config = require 'lspconfig'

require 'mason-lspconfig'.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name)
    lsp_config[server_name].setup {}
  end,
  ['sumneko_lua'] = function()
    lsp_config.sumneko_lua.setup {
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

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { "*.*" },
  callback = function()
    if vim.bo.filetype == 'kotlin' then
      return
    end
    vim.cmd [[
      if exists(":EslintFixAll")
        EslintFixAll
      endif
    ]]
    vim.lsp.buf.format({ async = false })
  end
})

require 'lsp_signature'.setup()
