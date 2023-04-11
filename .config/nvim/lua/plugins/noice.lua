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
      require('which-key').register(
        { n = { ':Telescope notify<cr>', 'Show recent notifications' } },
        { prefix = '<leader>' }
      )
    end,
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
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
    },
  },
}
