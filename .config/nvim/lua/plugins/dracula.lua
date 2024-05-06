return {
  {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      local dracula = require 'dracula'
      print(dracula.colors)

      dracula.setup {
        transparent = true,
        on_highlights = function(colors)
          return {
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
          }
        end,
      }
      vim.cmd.colorscheme 'dracula'
    end,
  },
}
