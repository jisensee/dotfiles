return {
  {
    'rmagatti/auto-session',
    cond = not vim.g.started_by_firenvim,
    config = true,
  },
  {
    'ellisonleao/glow.nvim',
    cond = not vim.g.started_by_firenvim,
    config = true,
  },
  'romainl/vim-cool',
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        names = false,
        tailwind = true,
      },
    },
    config = true,
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'rcarriga/nvim-notify',
    },
    cond = not vim.g.started_by_firenvim,
    config = function()
      require('telescope').load_extension 'harpoon'
      local wk = require 'which-key'
      local notify = require 'notify'

      wk.register({
        a = {
          function()
            require('harpoon.mark').add_file()
            notify('Added file to harpoon', 'info', { title = 'Harpoon' })
          end,
          'Add file to harpoon',
        },
        m = {
          require('telescope').extensions.harpoon.marks,
          'Open marked files',
        },
      }, { prefix = '<leader>' })
    end,
  },
}
