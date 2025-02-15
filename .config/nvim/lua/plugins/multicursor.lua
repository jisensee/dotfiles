return {
  {
    'jake-stewart/multicursor.nvim',
    config = function()
      local mc = require 'multicursor-nvim'
      mc.setup()
    end,
    keys = {
      {
        '<leader><up>',
        function() require('multicursor-nvim').lineAddCursor(-1) end,
        desc = 'Add cursor above',
      },
      {
        '<leader><down>',
        function() require('multicursor-nvim').lineAddCursor(1) end,
        desc = 'Add cursor below',
      },
      {
        '<C-up>',
        function() require('multicursor-nvim').lineSkipCursor(-1) end,
      },
      {
        '<C-down>',
        function() require('multicursor-nvim').lineSkipCursor(1) end,
      },
      {
        '<leader>cc',
        function() require('multicursor-nvim').clearCursors() end,
        desc = 'Clear cursors',
      },
      {
        '<leader>cn',
        function() require('multicursor-nvim').nextCursor() end,
        desc = 'Next cursor',
      },
      {
        '<leader>cp',
        function() require('multicursor-nvim').prevCursor() end,
        desc = 'Previous cursor',
      },
      {
        '<leader>ct',
        function() require('multicursor-nvim').toggleCursor() end,
        desc = 'Toggle cursor',
      },
      {
        '<leader>ca',
        function() require('multicursor-nvim').alignCursors() end,
        desc = 'Align cursors',
      },
      {
        '<leader>ce',
        function() require('multicursor-nvim').enableCursors() end,
        desc = 'Enable cursors',
      },
    },
  },
}
