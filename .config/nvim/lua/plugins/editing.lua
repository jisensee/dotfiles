return {
  'wellle/targets.vim',
  'tpope/vim-repeat',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  'tpope/vim-surround',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require(
          'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
      }
    end,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'InsertEnter',
    opts = {
      show_current_context = true,
      show_current_context_start = true,
    },
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
    event = 'InsertEnter',
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
  {
    'github/copilot.vim',
    cond = not vim.g.started_by_firenvim,
    event = 'InsertEnter',
    config = function()
      vim.cmd [[imap <silent><script><expr> <C-Space> copilot#Accept("")]]
    end,
  },
}
