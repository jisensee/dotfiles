return {
  {
    'akinsho/toggleterm.nvim',
    cond = not vim.g.started_by_firenvim,
    config = function()
      local wk = require 'which-key'
      require 'toggleterm'.setup()

      wk.register({
        name = 'Terminal',
        t = { ':ToggleTerm size=20<cr>', 'Open terminal' },
        h = { ':ToggleTerm size=20 dir="%:p:h"<cr>', 'Open terminal here' },
        u = { '<c-\\><c-N>', 'Unfocus terminal', mode = 't' },
        i = { '<c-\\><c-N>:resize +5<cr>i', 'Increase terminal size by a bit', mode = 't' },
        I = { '<c-\\><c-N>:resize +10<cr>i', 'Increase terminal size by a lot', mode = 't' },
        d = { '<c-\\><c-N>:resize -5<cr>i', 'Increase terminal size by a bit', mode = 't' },
        D = { '<c-\\><c-N>:resize -10<cr>i', 'Decrease terminal size by a lot', mode = 't' },
        m = { '<c-\\><c-N><c-w>_i', 'Maximize terminal window', mode = 't' },
        r = { '<c-\\><c-N>:resize 20<cr>i', 'Restore default terminal size', mode = 't' },
      }, { prefix = '<c-t>' })
    end
  }
}
