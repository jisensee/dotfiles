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
  W = { 'noa :w<cr>', 'Write buffer without running autocommands' },
  x = { ':x<cr>', 'Write buffer then quit' },
  q = { ':q<cr>', 'Quit buffer' },
  Q = { ':q!<cr>', 'Quit buffer without saving' },

  -- misc
  o = { 'o<esc>k', 'Insert empty below' },
  O = { 'O<esc>j', 'Insert empty above' },
  U = { 'gUiWe', 'Uppercase word' },
}, { prefix = '<leader>' })

wk.register({
  A = { '<c-K>A:' },
  a = { '<c-K>a:' },
  O = { '<c-K>O:' },
  o = { '<c-K>o:' },
  U = { '<c-K>U:' },
  u = { '<c-K>u:' },
  s = { '<c-K>s:' },
}, { prefix = '\\', mode = 'i' })
