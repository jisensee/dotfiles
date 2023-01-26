return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      view = {
        adaptive_size = true,
      },
    },
    cond = not vim.g.started_by_firenvim,
    config = function(_, opts)
      require 'nvim-tree'.setup(opts)
      local wk = require 'which-key'
      wk.register({
        name = 'Filetree',
        t = { ':NvimTreeToggle<cr>', 'Toggle filetree' },
        o = { ':NvimTreeFindFile<cr>', 'Open filetree at current file' },
        f = { ':NvimTreeFocus<cr>', 'Focus filetree' },
      }, { prefix = '<leader>t' })
    end
  }
}
