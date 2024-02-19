return {
  'chaoren/vim-wordmotion',
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      labels = 'aoeuidhtnspg',
      label = {
        rainbow = {
          enabled = true,
        },
      },
    },
    keys = {
      {
        's',
        mode = 'n',
        function() require('flash').jump() end,
      },
      {
        'S',
        mode = 'n',
        function()
          require('flash').jump {
            pattern = vim.fn.expand '<cword>',
          }
        end,
      },
      {
        '<C-Enter>',
        mode = 'n',
        function() require('flash').treesitter_search() end,
      },
      {
        '<S-Enter>',
        mode = 'n',
        function() require('flash').treesitter() end,
      },
      {
        'r',
        mode = 'o',
        function() require('flash').remote() end,
      },
    },
    config = true,
  },
}
