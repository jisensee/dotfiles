local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

-- leader key
nmap('<space>', '<nop>')
vim.g.mapleader = " "

-- copy & paste
nmap('<leader>y', '"+y')
nmap('<leader>p', '"+p')

-- uppercase word
nmap('<leader>uw', 'gUiWe')

-- window navigation
nmap('<leader>h', '<c-w>h')
nmap('<leader>j', '<c-w>j')
nmap('<leader>k', '<c-w>k')
nmap('<leader>l', '<c-w>l')

-- widdow manipulation
nmap('<leader>H', '<c-w>H')
nmap('<leader>J', '<c-w>J')
nmap('<leader>J', '<c-w>J')
nmap('<leader>L', '<c-w>L')

-- insert line
nmap('<leader>o', 'o<esc>k')
nmap('<leader>O', 'O<esc>j')

-- center when searching
nmap('n', 'nzz')
nmap('N', 'Nzz')

-- umlauts
imap('\\A', '<c-K>A:')
imap('\\a', '<c-K>a:')
imap('\\O', '<c-K>O:')
imap('\\o', '<c-K>o:')
imap('\\U', '<c-K>U:')
imap('\\u', '<c-K>u:')
imap('\\s', '<c-K>ss')

-- saving & quitting
nmap('<leader>s', ':w<cr>')
-- nmap('<leader>s', function()
--   vim.lsp.buf.format()
--   vim.cmd [[ :EslintFixAll<cr> ]]
--   vim.cmd [[ :w<cr> ]]
-- end)
nmap('<leader>x', ':x<cr>')
nmap('<leader>q', ':q<cr>')
nmap('<leader>Q', ':q!<cr>')

-- source init.lua
nmap('<leader>rl', ':source $MYVIMRC<cr>')

-- nvim-tree
nmap('<leader>tt', ':NvimTreeToggle<cr>')
nmap('<leader>to', ':NvimTreeFindFile<cr>')
nmap('<leader>tf', ':NvimTreeFocus<cr>')

-- telescope
local telescope = require 'telescope.builtin'
nmap('<leader>f', telescope.find_files)
nmap('<leader>g', telescope.live_grep)
nmap('<leader><leader>', telescope.builtin)

-- lsp
nmap('gh', vim.lsp.buf.hover)
nmap('gd', telescope.lsp_definitions)
nmap('gr', telescope.lsp_references)
nmap('gs', telescope.lsp_document_symbols)
nmap('<leader>r', vim.lsp.buf.rename)
nmap('<leader>.', ':CodeActionMenu<cr>')
nmap('<leader>dn', vim.diagnostic.goto_next)
nmap('<leader>dp', vim.diagnostic.goto_prev)
nmap('<leader>,', vim.diagnostic.open_float)
nmap('==', vim.lsp.buf.format)
