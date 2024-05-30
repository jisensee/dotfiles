local list = require 'util.list'

return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      auto_open = false,
      auto_close = true,
    },
    keys = {
      {
        '<leader>dd',
        ':Trouble document_diagnostics<cr>',
        desc = 'Open document diagnostics',
        silent = true,
      },
      {
        '<leader>dw',
        ':Trouble workspace_diagnostics<cr>',
        desc = 'Open workspace diagnostics',
        silent = true,
      },
    },
  },
  {
    'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
    opts = {
      autocmd = { enabled = true },
    },
  },
  {
    'aznhe21/actions-preview.nvim',
    keys = {
      {
        '<leader>.',
        function() require('actions-preview').code_actions() end,
        desc = 'Show code actions',
        silent = true,
      },
    },
  },
  {
    'RRethy/vim-illuminate',
    cond = true,
    opts = {
      filetypes_denylist = {
        'NvimTree',
      },
    },
    config = function(_, opts)
      local illuminate = require 'illuminate'
      illuminate.configure(opts)

      -- local colors = require 'dracula.colors'
      local hl_groups = {
        'IlluminatedWordText',
        'IlluminatedWordRead',
        'IlluminatedWordWrite',
      }
      list.foreach(hl_groups, function(group)
        vim.api.nvim_set_hl(0, group, {
          -- bg = colors.nontext,
          underline = true,
        })
      end)

      local wk = require 'which-key'
      wk.register({
        V = {
          illuminate.goto_prev_reference,
          'Goto prev reference illuminated token',
        },
        Z = {
          illuminate.goto_next_reference,
          'Goto next reference illuminated token',
        },
      }, { prefix = '<leader>' })
    end,
  },
  {
    'smjonas/inc-rename.nvim',
    name = 'inc_rename',
    config = true,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    config = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-tree.lua',
    },
  },
}
