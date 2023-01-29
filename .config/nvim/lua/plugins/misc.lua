return {
  {
    'rmagatti/auto-session',
    cond = not vim.g.started_by_firenvim,
    config = true,
  },
  {
    'ellisonleao/glow.nvim',
    cond = not vim.g.started_by_firenvim,
    config = true,
  },
  'romainl/vim-cool',
  {
    'chrisbra/Colorizer',
    init = function()
      vim.g.colorizer_auto_color = 1
    end
  }
}
