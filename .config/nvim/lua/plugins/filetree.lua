return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cond = not vim.g.started_by_firenvim,
    opts = {
      view = {
        side = 'right',
        adaptive_size = true,
      },
    },
    keys = {
      {
        '<leader>tt',
        ':NvimTreeToggle<cr>',
        desc = 'Toggle filetree',
        silent = true,
      },
      {
        '<leader>to',
        ':NvimTreeFindFile<cr>',
        desc = 'Open filetree at current file',
        silent = true,
      },
      {
        '<leader>tf',
        ':NvimTreeFocus<cr>',
        desc = 'Focus filetree',
        silent = true,
      },
    },
  },
}
