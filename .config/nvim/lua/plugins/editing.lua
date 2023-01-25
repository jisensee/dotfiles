return {
  'wellle/targets.vim',
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  'tpope/vim-surround',
  {
    'numToStr/Comment.nvim',
    config = true,
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
  }
}
