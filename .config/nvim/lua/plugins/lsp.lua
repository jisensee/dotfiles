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

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',

      'theHamsta/nvim-semantic-tokens',
    },
    cond = not vim.g.started_by_firenvim,
    config = function()
      require 'nvim-semantic-tokens'.setup {
        preset = 'default',
        highlighters = { require 'nvim-semantic-tokens.table-highlighter' }
      }
      local lsp = require 'lsp-zero'
      lsp.preset 'recommended'
      lsp.nvim_workspace()
      lsp.on_attach(on_attach)
      lsp.setup()
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    cond = not vim.g.started_by_firenvim,
    config = function()
      local nls = require 'null-ls'
      local helpers = require 'null-ls.helpers'
      local ktfmt_source = require 'formatting'.make_ktfmt_source(nls, helpers)

      nls.setup {
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.eslint_d,
          nls.builtins.code_actions.eslint_d,
          nls.builtins.formatting.rustywind,
          ktfmt_source,
        }
      }
    end
  }
}
