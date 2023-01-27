local wk = require 'which-key'

wk.register({
  -- copy & pasting
  y = { '"+y', 'Yank into clipboard' },
  p = { '"+p', 'Paste from clipboard' },

  -- window navigation
  h = { '<c-w>h', 'Move one window to the left' },
  j = { '<c-w>j', 'Move one window down' },
  k = { '<c-w>k', 'Move one window up' },
  l = { '<c-w>l', 'Move one window to the right' },

  -- window manipulation
  H = { '<c-w>H', 'Move current window to the left' },
  J = { '<c-w>J', 'Move current window down' },
  K = { '<c-w>K', 'Move current window up' },
  L = { '<c-w>L', 'Move current window to the right' },

  -- saving & quitting
  w = { ':w<cr>', 'Write buffer' },
  W = { ':noa w<cr>', 'Write buffer without running autocommands' },
  x = { ':x<cr>', 'Write buffer then quit' },
  X = { ':xa<cr>', 'Write all buffers then quit' },
  q = { ':q<cr>', 'Quit buffer' },
  Q = { ':q!<cr>', 'Quit buffer without saving' },
  E = { ':qa<cr>', 'Quit neovim' },

  -- misc
  o = { 'o<esc>k', 'Insert empty below' },
  O = { 'O<esc>j', 'Insert empty above' },
  U = { 'gUiWe', 'Uppercase word' },
}, { prefix = '<leader>' })


-- Center screen when searching
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

vim.keymap.set('n', '<esc>', ':noh<cr>')

-- Umlauts
vim.keymap.set('i', '\\a', '<c-k>a:')
vim.keymap.set('i', '\\A', '<c-k>A:')
vim.keymap.set('i', '\\o', '<c-k>o:')
vim.keymap.set('i', '\\O', '<c-k>O:')
vim.keymap.set('i', '\\u', '<c-k>u:')
vim.keymap.set('i', '\\U', '<c-k>U:')
vim.keymap.set('i', '\\s', '<c-k>s:')
