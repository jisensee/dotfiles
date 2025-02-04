return {
  {
    'supermaven-inc/supermaven-nvim',
    cond = not vim.g.started_by_firenvim,
    config = function()
      require('supermaven-nvim').setup {
        ignore_filetypes = {
          codecompanion = true,
        },
        keymaps = {
          accept_suggestion = '<C-Space>',
          accept_word = '<C-j>',
          clear_suggestion = '<C-]>',
        },
      }
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      display = {
        diff = {
          enabled = true,
          provider = 'mini_diff',
        },
      },
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
      },
    },
  },
}
