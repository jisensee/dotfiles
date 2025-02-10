local list = require 'util.list'

return {
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
      wk.add {
        {
          '<leader>V',
          illuminate.goto_prev_reference,
          desc = 'Goto prev reference illuminated token',
        },
        {
          '<leader>Z',
          illuminate.goto_next_reference,
          desc = 'Goto next reference illuminated token',
        },
      }
    end,
  },
  {
    'smjonas/inc-rename.nvim',
    name = 'inc_rename',
    config = true,
  },
  {
    'davidmh/mdx.nvim',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
