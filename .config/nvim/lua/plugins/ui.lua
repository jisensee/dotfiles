return {
  'stevearc/dressing.nvim',
  {
    'declancm/cinnamon.nvim',
    opts = {
      keymaps = {
        basic = true,
        extra = true,
      },
    },
  },
  {
    'mbbill/undotree',
    cond = not vim.g.started_by_firenvim,
    keys = {
      {
        '<leader>u',
        ':UndotreeToggle<cr>',
        desc = 'Toggle undotree',
        silent = true,
      },
    },
  },
}
