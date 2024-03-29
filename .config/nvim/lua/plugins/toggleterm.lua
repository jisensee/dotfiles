local function uf(mapping) return '<c-\\><c-N>' .. mapping end

return {
  {
    'akinsho/toggleterm.nvim',
    cond = not vim.g.started_by_firenvim,
    keys = {
      {
        '<c-t>t',
        uf ':ToggleTerm size=20<cr>',
        desc = 'Open terminal',
        mode = { 'n', 't' },
        silent = true,
      },
      {
        '<c-t>h',
        ':ToggleTerm size=20 dir="%:p:h"<cr>',
        desc = 'Open terminal here',
        silent = true,
      },
    },
    config = function()
      local wk = require 'which-key'
      require('toggleterm').setup()

      wk.register({
        name = 'Terminal',
        u = { uf '', 'Unfocus terminal', mode = 't' },
        i = {
          uf ':resize +5<cr>i',
          'Increase terminal size by a bit',
          mode = 't',
        },
        I = {
          uf ':resize +10<cr>i',
          'Increase terminal size by a lot',
          mode = 't',
        },
        d = {
          uf ':resize -5<cr>i',
          'Increase terminal size by a bit',
          mode = 't',
        },
        D = {
          uf ':resize -10<cr>i',
          'Decrease terminal size by a lot',
          mode = 't',
        },
        m = { uf '<c-w>_i', 'Maximize terminal window', mode = 't' },
        r = {
          uf ':resize 20<cr>i',
          'Restore default terminal size',
          mode = 't',
        },
      }, { prefix = '<c-t>' })
    end,
  },
}
