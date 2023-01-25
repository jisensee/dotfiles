return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      auto_open = false,
      auto_close = true,
    },
    config = function(_, opts)
      require 'trouble'.setup(opts)
      local wk = require 'which-key'

      wk.register({
        name = 'Diagnostics window',
        d = { ':Trouble document_diagnostics<cr>', 'Open document diagnostics' },
        w = { ':Trouble workspace_diagnostics<cr>', 'Open workspace diagnostics' },
      }, { prefix = '<leader>d' })
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
    opts = {
      autocmd = { enabled = true },
    }
  },
  {
    'weilbith/nvim-code-action-menu',
    config = function()
      require 'which-key'.register({
        ['<leader>.'] = { ':CodeActionMenu<cr>', 'Show code actions' }
      })
    end
  }
}
