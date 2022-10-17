require 'mason'.setup()

require 'mason-lspconfig'.setup {
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
