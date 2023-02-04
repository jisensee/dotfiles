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
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        names = false,
        tailwind = true,
      }
    },
    config = true,
  },
}
