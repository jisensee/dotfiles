return {
  {
    'lewis6991/gitsigns.nvim',
    cond = not vim.g.started_by_firenvim,
    config = true,
  },
  {
    'TimUntersberger/neogit',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = not vim.g.started_by_firenvim,
    event = 'VeryLazy',
    config = true,
  },
  {
    'f-person/git-blame.nvim',
    init = function() vim.g.gitblame_enabled = 0 end,
    keys = {
      {
        '<leader>b',
        ':GitBlameToggle<cr>',
        desc = 'Toggle git blame',
        silent = true,
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
  },
}
