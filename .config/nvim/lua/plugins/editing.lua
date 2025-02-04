local colors = require '../colors'
return {
  'tpope/vim-repeat',
  {
    'echasnovski/mini.ai',
    version = '*',
    config = true,
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    config = true,
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    config = true,
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    config = true,
  },
  {
    'echasnovski/mini.comment',
    version = '*',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = true,
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring()
        end,
      },
    },
  },
  {
    'echasnovski/mini.move',
    version = '*',
    config = true,
    opts = {
      mappings = {
        down = '<M-t>',
        up = '<M-c>',
        line_down = '<M-t>',
        line_up = '<M-c>',
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = colors.bright_red })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = colors.bright_yellow })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = colors.bright_blue })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = colors.orange })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = colors.bright_green })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = colors.purple })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = colors.bright_cyan })
      end)
      require('ibl').setup {
        indent = {
          char = '│',
          highlight = {
            'RainbowRed',
            'RainbowYellow',
            'RainbowBlue',
            'RainbowOrange',
            'RainbowGreen',
            'RainbowViolet',
            'RainbowCyan',
          },
        },
      }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = true,
  },
  {
    'mizlan/iswap.nvim',
    opts = {
      keys = 'aoeuhtns',
    },
    keys = {
      {
        '<leader>sa',
        ':ISwapWith<cr>',
        desc = 'Swap element under cursor with adjacent',
        silent = true,
      },
      {
        '<leader>sl',
        ':ISwapWithLeft<cr>',
        desc = 'Swap element under cursor with element to the right',
        silent = true,
      },
      {
        '<leader>sr',
        ':ISwapWithRight<cr>',
        desc = 'Swap element under cursor with element to the left',
        silent = true,
      },
    },
  },
  {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<c-n>',
        backwards_tabkey = '<c-s>',
        act_as_tab = false,
        act_as_shift_tab = false,
        completion = false,
      }
    end,
  },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    cond = not vim.g.started_by_firenvim,
    keys = {
      {
        '<leader>c',
        ':Telescope neoclip<cr>',
        desc = 'Open Neoclip',
      },
    },
    config = function()
      require('neoclip').setup()
      require('telescope').load_extension 'neoclip'
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    cond = not vim.g.started_by_firenvim,
    keys = {
      {
        '<leader>S',
        function() require('spectre').open() end,
        desc = 'Open Spectre',
      },
    },
    config = true,
  },
  {
    'bennypowers/splitjoin.nvim',
    cond = false,
    keys = {
      {
        'gj',
        function() require('splitjoin').join() end,
        desc = 'Join the object under cursor',
      },
      {
        'g,',
        function() require('splitjoin').split() end,
        desc = 'Split the object under cursor',
      },
    },
  },
}
