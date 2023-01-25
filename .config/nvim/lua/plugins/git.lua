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
    config = true,
  },
  {
    'f-person/git-blame.nvim',
    init = function()
      vim.g.gitblame_enabled = 0
    end,
    config = function()
      require 'which-key'.register({
        b = { ':GitBlameToggle<cr>', 'Toggle git blame' },
      }, { prefix = '<leader>' })
    end
  },
}
