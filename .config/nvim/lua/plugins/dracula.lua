local red = '#FF5555'
local orange = '#FFB86C'
local cyan = '#8BE9FD'

return {
  {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        bg = '#282A36',
        fg = '#F8F8F2',
        selection = '#2f3242',
        comment = '#7a88f2',
        red = red,
        orange = orange,
        yellow = '#F1FA8C',
        green = '#50fa7b',
        purple = '#BD93F9',
        cyan = cyan,
        pink = '#FF79C6',
        bright_red = '#FF6E6E',
        bright_green = '#69FF94',
        bright_yellow = '#FFFFA5',
        bright_blue = '#D6ACFF',
        bright_magenta = '#FF92DF',
        bright_cyan = '#A4FFFF',
        bright_white = '#FFFFFF',
        menu = '#21222C',
        visual = '#3E4452',
        gutter_fg = '#4B5263',
        nontext = '#3B4048',
      },
      transparent = true,
      override = {
        DiagnosticUnderlineError = {
          fg = 'NONE',
          sp = red,
          underline = true,
        },
        DiagnosticUnderlineWarn = {
          fg = 'NONE',
          sp = orange,
          underline = true,
        },
        DiagnosticUnderlineInfo = {
          fg = 'NONE',
          sp = cyan,
          underline = true,
        },
        DiagnosticUnderlineHint = {
          fg = 'NONE',
          sp = cyan,
          underline = true,
        },
      },
    },
    config = function(_, opts)
      require('dracula').setup(opts)
      vim.cmd [[colorscheme dracula]]
    end,
  },
}
