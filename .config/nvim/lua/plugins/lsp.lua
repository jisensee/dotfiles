require 'mason'.setup()

require 'nvim-semantic-tokens'.setup {
  preset = 'default',
  highlighters = { require 'nvim-semantic-tokens.table-highlighter' }
}

require 'mason-lspconfig'.setup {
  automatic_installation = true,
}

local lsp_config = require 'lspconfig'

local function on_attach(client, bufnr)
  local caps = client.server_capabilities
  if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
    local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
    vim.api.nvim_create_autocmd("TextChanged", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.semantic_tokens_full()
      end,
    })
    -- fire it first time on load as well
    vim.lsp.buf.semantic_tokens_full()
  end
end

require 'mason-lspconfig'.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name)
    lsp_config[server_name].setup {
      on_attach = on_attach
    }
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
