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
      '<leader>v',
      vim.diagnostic.goto_prev,
      buffer = bufnr,
      desc = 'Go to previous diagnostic',
    },
    {
      '<leader>z',
      vim.diagnostic.goto_next,
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

local function snippets_setup()
  require('luasnip.loaders.from_lua').load { paths = { './snippets' } }
  local ls = require 'luasnip'
  ls.filetype_extend('typescriptreact', { 'typescript' })
end

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
      -- LSP
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'yioneko/nvim-vtsls',
      'L3MON4D3/LuaSnip',
    },
    cond = not vim.g.started_by_firenvim,
    config = function()
      lsp_zero_setup()
      snippets_setup()
    end,
  },
  {
    'saghen/blink.cmp',
    version = '*',
    cond = not vim.g.started_by_firenvim,
    opts = {
      enabled = function()
        return not vim.tbl_contains({ 'codecompanion' }, vim.bo.filetype)
          and vim.bo.buftype ~= 'prompt'
          and vim.b.completion ~= false
      end,
      completion = {
        documentation = {
          auto_show = true,
        },
        menu = {
          auto_show = function()
            return not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
          end,
        },
      },
      snippets = {
        preset = 'luasnip',
      },
      keymap = {
        preset = 'none',
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<C-e>'] = { function(cmp) cmp.show() end, 'fallback' },
      },
    },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      'davidosomething/format-ts-errors.nvim',
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
        ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
          if result.diagnostics == nil then return end

          -- ignore some tsserver diagnostics
          local idx = 1
          while idx <= #result.diagnostics do
            local entry = result.diagnostics[idx]

            local formatter = require('format-ts-errors')[entry.code]
            entry.message = formatter and formatter(entry.message)
              or entry.message

            -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
            if entry.code == 80001 then
              -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
              table.remove(result.diagnostics, idx)
            else
              idx = idx + 1
            end
          end

          vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
        end,
      },
    },
  },
}
