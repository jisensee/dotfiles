local function lsp_keymap(bufnr)
  local telescope = require 'telescope.builtin'
  local cinnamon = require 'cinnamon'
  local wk = require 'which-key'

  wk.add {
    {
      '<a-h>',
      vim.lsp.buf.signature_help,
      buffer = bufnr,
      desc = 'Show signature help',
    },
    { 'H', vim.lsp.buf.hover, buffer = bufnr, desc = 'Show lsp hover' },
    {
      'T',
      vim.diagnostic.open_float,
      buffer = bufnr,
      desc = 'Show diagnostic messages',
    },
  }

  wk.add {
    { '<leader>r', ':IncRename ', buffer = bufnr, desc = 'Rename symbol' },
    {
      '<leader>R',
      function() return ':IncRename ' .. vim.fn.expand '<cword>' end,
      buffer = bufnr,
      desc = 'Rename symbol with old name prefilled',
      expr = true,
    },
    {
      '<leader>v',
      function() vim.diagnostic.jump { count = 1 } end,
      buffer = bufnr,
      desc = 'Go to previous diagnostic',
    },
    {
      '<leader>z',
      function() vim.diagnostic.jump { count = -1 } end,
      buffer = bufnr,
      desc = 'Go to next diagnostic',
    },
  }

  wk.add {
    {
      'gd',
      function() cinnamon.scroll(telescope.lsp_definitions) end,
      buffer = bufnr,
      desc = 'Go to definition',
    },
    {
      'gD',
      telescope.lsp_implementiations,
      buffer = bufnr,
      desc = 'Show implementations',
    },
    {
      'go',
      telescope.lsp_type_definitions,
      buffer = bufnr,
      desc = 'Go to type definition of current symbol',
    },
    {
      'gr',
      telescope.lsp_references,
      buffer = bufnr,
      desc = 'Show all references',
    },
    {
      'gs',
      telescope.lsp_document_symbols,
      buffer = bufnr,
      desc = 'Show document symbols',
    },
    {
      'gws',
      telescope.lsp_workspace_symbols,
      buffer = bufnr,
      desc = 'Show workspace symbols',
    },
  }
end

local function lsp_zero_setup()
  local lsp_zero = require 'lsp-zero'

  local lsp_attach = function(_, bufnr) lsp_keymap(bufnr) end
  lsp_zero.on_attach(function(_, bufnr) lsp_keymap(bufnr) end)
  lsp_zero.set_sign_icons {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»',
  }
  lsp_zero.extend_lspconfig {
    lsp_attach = lsp_attach,
    float_border = 'rounded',
    sign_text = true,
  }

  require('mason').setup()
  require('mason-lspconfig').setup {
    handlers = {
      lsp_zero.default_setup,
    },
  }

  local lspconfig = require 'lspconfig'
  lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
end

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    cond = not vim.g.started_by_firenvim,
    dependencies = {
      -- LSP
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function() lsp_zero_setup() end,
  },
  { 'dmmulroy/ts-error-translator.nvim' },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    cond = not vim.g.started_by_firenvim,
    opts = {
      settings = {
        expose_as_code_action = 'all',
        tsserver_plugins = {
          '@styled/typescript-styled-plugin',
        },
      },
      handlers = {
        ['textDocument/publishDiagnostics'] = function(err, result, ctx)
          require('ts-error-translator').translate_diagnostics(err, result, ctx)
          vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
        end,
      },
    },
  },
}
