return {
  'stevearc/dressing.nvim',
  {
    'declancm/cinnamon.nvim',
    opts = {
      default_keymaps = true,
      extra_keymaps = true,
      extended_keymaps = true,
      scroll_limit = 75,
      max_length = 100,
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
