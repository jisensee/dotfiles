local wk = require 'which-key'

wk.add {
  -- copy & pasting
  { '<leader>y', '"+y', desc = 'Yank into clipboard' },
  { '<leader>p', '"+p', desc = 'Paste from clipboard' },

  -- window navigation
  { '<leader>j', '<c-w>j', desc = 'Move one window down' },
  { '<leader>k', '<c-w>k', desc = 'Move one window up' },
  { '<leader>l', '<c-w>l', desc = 'Move one window to the right' },
  { '<leader>h', '<c-w>h', desc = 'Move one window to the left' },

  -- window manipulation
  { '<leader>H', '<c-w>H', desc = 'Move current window to the left' },
  { '<leader>J', '<c-w>J', desc = 'Move current window down' },
  { '<leader>K', '<c-w>K', desc = 'Move current window up' },
  { '<leader>L', '<c-w>L', desc = 'Move current window to the right' },

  -- saving & quitting
  { '<leader>E', ':qa<cr>', desc = 'Quit neovim' },
  { '<leader>q', ':q<cr>', desc = 'Quit buffer' },
  { '<leader>w', ':w<cr>', desc = 'Write buffer' },
  { '<leader>x', ':x<cr>', desc = 'Write buffer then quit' },
  {
    '<leader>W',
    ':noa w<cr>',
    desc = 'Write buffer without running autocommands',
  },
  { '<leader>X', ':xa<cr>', desc = 'Write all buffers then quit' },
  { '<leader>Q', ':q!<cr>', desc = 'Quit buffer without saving' },

  -- misc
  { '<leader>o', 'o<esc>k', desc = 'Insert empty below' },
  { '<leader>O', 'O<esc>j', desc = 'Insert empty above' },
  { '<leader>U', 'gUiWe', desc = 'Uppercase word' },
}

-- Center screen when searching
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

-- Umlauts
vim.keymap.set('i', '\\a', '<c-k>a:')
vim.keymap.set('i', '\\A', '<c-k>A:')
vim.keymap.set('i', '\\o', '<c-k>o:')
vim.keymap.set('i', '\\O', '<c-k>O:')
vim.keymap.set('i', '\\u', '<c-k>u:')
vim.keymap.set('i', '\\U', '<c-k>U:')
vim.keymap.set('i', '\\s', '<c-k>ss')
