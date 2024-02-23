return {
  {
    'rmagatti/auto-session',
    cond = not vim.g.started_by_firenvim,
    config = true,
  },
  {
    'ellisonleao/glow.nvim',
    cond = not vim.g.started_by_firenvim,
    event = 'VeryLazy',
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
    keys = {
      {
        '<leader>a',
        function()
          require('harpoon.mark').add_file()

          local notify = require 'notify'
          notify('Added file to harpoon', 'info', { title = 'Harpoon' })
        end,
        desc = 'Add file to harpoon',
      },
      {
        '<leader>m',
        function() require('telescope').extensions.harpoon.marks() end,
        desc = 'Open marked files',
      },
    },
    config = function() require('telescope').load_extension 'harpoon' end,
  },
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    keys = {
      {
        '<leader>D',
        function() require('dbee').toggle() end,
        desc = 'Toggle dbee',
      },
    },
    build = function() require('dbee').install() end,
    config = true,
  },
  {
    'jisensee/abc.nvim',
    config = function() require('abc-nvim').setup() end,
    ft = 'abc',
  },
}
