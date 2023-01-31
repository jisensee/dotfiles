local function lsp_keymap(bufnr)
  local telescope = require 'telescope.builtin'
  local wk = require 'which-key'

  wk.register({
    H = { vim.lsp.buf.hover, 'Show lsp hover' },
    T = { vim.diagnostic.open_float, 'Show diagnostic messages' },
    ['<a-h>'] = { vim.lsp.buf.signature_help, 'Show signature help' }
  }, { buffer = bufnr })

  wk.register({
    r = { vim.lsp.buf.rename, 'Rename symbol' },
    v = { vim.diagnostic.goto_prev, 'Go to previous diagnostic' },
    z = { vim.diagnostic.goto_prev, 'Go to next diagnostic' },
  }, { prefix = '<leader>', buffer = bufnr })

  wk.register({
    d = { telescope.lsp_definitions, 'Go to definition' },
    D = { telescope.lsp_implementiations, 'Show implementations' },
    r = { telescope.lsp_references, 'Show all references' },
    o = { telescope.lsp_type_definitions, 'Go to type definition of current symbol' },
    s = { telescope.lsp_document_symbols, 'Show document symbols' },
    S = { telescope.lsp_worksapce_symbols, 'Show workspace symbols' },
  }, { prefix = 'g', buffer = bufnr })
end

local function on_attach(client, bufnr)
  local caps = client.server_capabilities
  lsp_keymap(bufnr)

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

local function semantic_tokens_setup()
  require 'nvim-semantic-tokens'.setup {
    preset = 'default',
    highlighters = { require 'nvim-semantic-tokens.table-highlighter' }
  }
end

local function lsp_zero_setup()
  local lsp = require 'lsp-zero'
  lsp.preset 'recommended'
  lsp.set_preferences {
    set_lsp_keymaps = false
  }
  lsp.nvim_workspace()
  lsp.on_attach(on_attach)
  lsp.setup()

  vim.diagnostic.config {
    virtual_text = true,
  }
end

local function snippets_setup()
  require 'luasnip.loaders.from_lua'.lazy_load {
    paths = { './snippets' }
  }
  local ls = require 'luasnip'
  ls.filetype_extend('typescriptreact', { 'typescript' })
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

      -- Other
      'theHamsta/nvim-semantic-tokens',
      'nvim-telescope/telescope.nvim',
    },
    cond = not vim.g.started_by_firenvim,
    config = function()
      semantic_tokens_setup()
      lsp_zero_setup()
      snippets_setup()
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
          ktfmt_source,
        }
      }
    end
  }
}
