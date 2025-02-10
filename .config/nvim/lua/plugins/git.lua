return {
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
}
