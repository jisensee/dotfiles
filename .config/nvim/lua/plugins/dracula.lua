local colors = require '../colors'

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
      }
      vim.cmd.colorscheme 'dracula'
    end,
  },
}
