local list = require 'util.list'

return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      auto_open = false,
      auto_close = true,
    },
    config = function(_, opts)
      require('trouble').setup(opts)
      local wk = require 'which-key'

      wk.register({
        name = 'Diagnostics window',
        d = { ':Trouble document_diagnostics<cr>', 'Open document diagnostics' },
        w = {
          ':Trouble workspace_diagnostics<cr>',
          'Open workspace diagnostics',
        },
      }, { prefix = '<leader>d' })
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
    opts = {
      autocmd = { enabled = true },
    },
  },
  {
    'weilbith/nvim-code-action-menu',
    config = function()
      require('which-key').register {
        ['<leader>.'] = { ':CodeActionMenu<cr>', 'Show code actions' },
      }
    end,
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

      local colors = require 'dracula.palettes'
      local hl_groups = {
        'IlluminatedWordText',
        'IlluminatedWordRead',
        'IlluminatedWordWrite',
      }
      list.foreach(
        hl_groups,
        function(group)
          vim.api.nvim_set_hl(0, group, {
            bg = colors.nontext,
            underline = true,
          })
        end
      )

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
}
