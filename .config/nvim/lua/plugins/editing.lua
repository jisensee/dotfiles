return {
  'wellle/targets.vim',
  'tpope/vim-repeat',
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  'tpope/vim-surround',
  {
    'numToStr/Comment.nvim',
    config = function()
      require 'Comment'.setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      show_current_context = true,
      show_current_context_start = true,
    }
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
    config = function(_, opts)
      require 'iswap'.setup(opts)
      require 'which-key'.register({
        name = 'ISwap',
        a = { ':ISwapWith<cr>', 'Swap element under cursor with adjacent' },
        l = { ':ISwapWithLeft<cr>', 'Swap element under cursor with element to the right' },
        r = { ':ISwapWithRight<cr>', 'Swap element under cursor with element to the left' },
      }, { prefix = '<leader>s' })
    end
  },
  {
    'abecodes/tabout.nvim',
    config = function()
      require 'tabout'.setup {
        tabkey = '<c-n>',
        backwards_tabkey = '<c-s>',
        act_as_tab = false,
        act_as_shift_tab = false,
        completion = false,
      }
    end
  }
}
