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
        i = { '<c-\\><c-N>:resize +3<cr>i', 'Increase terminal size by a bit', mode = 't' },
        I = { '<c-\\><c-N>:resize +10<cr>i', 'Increase terminal size by a lot', mode = 't' },
        d = { '<c-\\><c-N>:resize +3<cr>i', 'Increase terminal size by a bit', mode = 't' },
        D = { '<c-\\><c-N>:resize -10<cr>i', 'Decrease terminal size by a lot', mode = 't' },
      }, { prefix = '<c-t>' })
    end
  }
}
