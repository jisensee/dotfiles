return {
  {
    'folke/which-key.nvim',
    cond = not vim.g.started_by_firenvim,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
    lazy = false,
    priority = 500,
  },
}
