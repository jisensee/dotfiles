local function lsp_keymap(bufnr)
  local telescope = require 'telescope.builtin'
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

  wk.add
 {
    {
      'gd',
      telescope.lsp_definitions,
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
      'gS',
      telescope.lsp_workspace_symbols,
      buffer = bufnr,
      desc = 'Show workspace symbols',
    },
  }
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
    snippet = {
      expand = function(args) require('luasnip').lsp_expand(args.body) end,
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

  local lsp_attach = function(_, bufnr) lsp_keymap(bufnr) end
  lsp_zero.on_attach(function(_, bufnr) lsp_keymap(bufnr) end)
  lsp_zero.set_sign_icons {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»',
  }
  lsp_zero.extend_lspconfig {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
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
  lspconfig.ts_ls.setup {
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
    branch = 'v4.x',
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
