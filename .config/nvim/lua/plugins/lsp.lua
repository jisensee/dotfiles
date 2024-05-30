local function lsp_keymap(bufnr)
  local telescope = require 'telescope.builtin'
  local wk = require 'which-key'

  wk.register({
    H = { vim.lsp.buf.hover, 'Show lsp hover' },
    T = { vim.diagnostic.open_float, 'Show diagnostic messages' },
    ['<a-h>'] = { vim.lsp.buf.signature_help, 'Show signature help' },
  }, { buffer = bufnr })

  wk.register({
    r = { ':IncRename ', 'Rename symbol' },
    v = { vim.diagnostic.goto_prev, 'Go to previous diagnostic' },
    z = { vim.diagnostic.goto_next, 'Go to next diagnostic' },
  }, { prefix = '<leader>', buffer = bufnr })

  wk.register({
    d = { telescope.lsp_definitions, 'Go to definition' },
    D = { telescope.lsp_implementiations, 'Show implementations' },
    r = { telescope.lsp_references, 'Show all references' },
    o = {
      telescope.lsp_type_definitions,
      'Go to type definition of current symbol',
    },
    s = { telescope.lsp_document_symbols, 'Show document symbols' },
    S = { telescope.lsp_worksapce_symbols, 'Show workspace symbols' },
  }, { prefix = 'g', buffer = bufnr })
end

local function cmp_setup()
  local lspkind = require 'lspkind'
  local cmp = require 'cmp'
  local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup {
    preselect = 'item',
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lua' },
    },
    formatting = {
      format = lspkind.cmp_format(),
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-e>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp_action.luasnip_supertab(),
      ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    },
  }
end

local function lsp_zero_setup()
  local lsp_zero = require 'lsp-zero'

  lsp_zero.on_attach(function(_, bufnr) lsp_keymap(bufnr) end)
  lsp_zero.set_sign_icons {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»',
  }

  require('mason').setup()
  require('mason-lspconfig').setup {
    handlers = {
      lsp_zero.default_setup,
    },
  }

  local lspconfig = require 'lspconfig'
  lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
  lspconfig.tsserver.setup {
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
  }

  cmp_setup()
end

local function snippets_setup()
  require('luasnip.loaders.from_lua').load { paths = { './snippets' } }
  local ls = require 'luasnip'
  ls.filetype_extend('typescriptreact', { 'typescript' })
end

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      -- CMP
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',

      -- MISC
      'davidosomething/format-ts-errors.nvim',
    },
    cond = not vim.g.started_by_firenvim,
    config = function()
      lsp_zero_setup()
      snippets_setup()
    end,
  },
}
