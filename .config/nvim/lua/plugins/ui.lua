return {
  'stevearc/dressing.nvim',
  {
    'declancm/cinnamon.nvim',
    opts = {
      keymaps = {
        basic = true,
        extra = true,
      },
      options = {
        max_delta = {
          time = 150,
        },
      },
    },
    config = function(_, opts)
      local cinnamon = require 'cinnamon'
      cinnamon.setup(opts)
      vim.keymap.set('n', '<C-U>', function() cinnamon.scroll '<C-U>zz' end)
      vim.keymap.set('n', '<C-D>', function() cinnamon.scroll '<C-D>zz' end)
    end,
  },
  {
    'mbbill/undotree',
    cond = not vim.g.started_by_firenvim,
    keys = {
      {
        '<leader>u',
        ':UndotreeToggle<cr>',
        desc = 'Toggle undotree',
        silent = true,
      },
    },
  },
  { 'echasnovski/mini.diff', version = '*', config = true },
}
