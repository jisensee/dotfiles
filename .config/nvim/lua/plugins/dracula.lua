local colors = require '../colors'

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
        red = colors.red,
        orange = colors.orange,
        yellow = colors.yellow,
        green = colors.green,
        purple = colors.purple,
        cyan = colors.cyan,
        pink = colors.pink,
        bright_red = colors.bright_red,
        bright_green = colors.bright_green,
        bright_yellow = colors.bright_yellow,
        bright_blue = colors.bright_blue,
        bright_magenta = colors.bright_magenta,
        bright_cyan = colors.bright_cyan,
        bright_white = colors.bright_white,
        menu = '#21222C',
        visual = '#3E4452',
        gutter_fg = '#4B5263',
        nontext = '#3B4048',
      },
      transparent = true,
      override = {
        DiagnosticUnderlineError = {
          fg = 'NONE',
          sp = colors.red,
          underline = true,
        },
        DiagnosticUnderlineWarn = {
          fg = 'NONE',
          sp = colors.orange,
          underline = true,
        },
        DiagnosticUnderlineInfo = {
          fg = 'NONE',
          sp = colors.cyan,
          underline = true,
        },
        DiagnosticUnderlineHint = {
          fg = 'NONE',
          sp = colors.cyan,
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
