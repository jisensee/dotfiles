return {
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    cond = not vim.g.started_by_firenvim,
    config = function(_, opts)
      require('noice').setup(opts)
      vim.keymap.set('n', '<Esc>', require('notify').dismiss)
      require('which-key').add {
        '<leader>n',
        ':Telescope notify<cr>',
        desc = 'Show recent notifications',
      }
    end,
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          silent = true,
        },
        documentation = {
          opts = {
            size = {
              max_width = 60,
            },
          },
        },
      },
      presets = {
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = { find = '.+%d+B written' },
          view = 'mini',
        },
        {
          filter = { find = 'Unable to find ESLint library.' },
          opts = { skip = true },
        },
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = '#000000',
    },
  },
}
