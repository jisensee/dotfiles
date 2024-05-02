return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/notes/personal',
        },
        {
          name = 'dnd',
          path = '~/notes/dnd',
        },
      },
    },
  },
}
