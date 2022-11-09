-- configure leader key
vim.keymap.set('n', '<space>', '<nop>', { noremap = true, silent = true })
vim.g.mapleader = " "

local codewindow = require 'codewindow'
local telescope = require 'telescope.builtin'

require 'legendary'.setup {
  keymaps = {
    -- copy & pasting
    { '<leader>y', '"+y', description = 'Yank into clipboard' },
    { '<leader>p', '"+p', description = 'Paste from clipboardr' },

    -- window navigation
    { '<leader>h', '<c-w>h', description = 'Move one window to the left' },
    { '<leader>j', '<c-w>j', description = 'Move one window down' },
    { '<leader>k', '<c-w>k', description = 'Move one window up' },
    { '<leader>l', '<c-w>l', description = 'Move one window to the right' },

    -- window manipulation
    { '<leader>H', '<c-w>H', description = 'Move current window to the left' },
    { '<leader>J', '<c-w>J', description = 'Move current window down' },
    { '<leader>K', '<c-w>K', description = 'Move current window up' },
    { '<leader>L', '<c-w>L', description = 'Move current window to the right' },

    -- saving & quitting
    { '<leader>s', ':w<cr>', description = 'Save buffer' },
    { '<leader>x', ':x<cr>', description = 'Save buffer then quit' },
    { '<leader>q', ':q<cr>', description = 'Quit buffer' },
    { '<leader>Q', ':q!<cr>', description = 'Quit buffer without saving' },

    -- nvim-tree
    { '<leader>tt', ':NvimTreeToggle<cr>', description = 'Toggle filetree' },
    { '<leader>to', ':NvimTreeFindFile<cr>', description = 'Open filetree at current file' },
    { '<leader>tf', ':NvimTreeFocus<cr>', description = 'Focus filetree' },

    -- telescope
    { '<leader>f', telescope.find_files, description = 'Find files' },
    { '<leader>g', telescope.live_grep, description = 'Live grep' },
    { '<leader>\'', telescope.buffers, description = 'Show buffers' },
    { '<leader><leader>', telescope.builtin, description = 'Show telescope pickers' },
    { '<leader>c', ':Legendary<cr>', description = 'Command palette' },

    -- lsp
    { 'gh', vim.lsp.buf.hover, description = 'Show lsp hover' },
    { 'gd', telescope.lsp_definitions, description = 'Go to definition' },
    { 'gD', telescope.lsp_implementations, description = 'Show implementations' },
    { 'gr', telescope.lsp_references, description = 'Show all references' },
    { 'gs', telescope.lsp_document_symbols, description = 'Show all symbols in file' },
    { '<leader>a', ':SymbolsOutline<cr>', description = 'Toggle symbol outline' },
    { '<leader>r', vim.lsp.buf.rename, description = 'Rename symbol' },
    { '<leader>,', vim.diagnostic.open_float, description = 'Show diagnostic at current position' },
    { '<leader>.', ':CodeActionMenu<cr>', description = 'Show code actions' },
    { '<leader>v', vim.diagnostic.goto_prev, description = 'Go to previous diagnostic' },
    { '<leader>z', vim.diagnostic.goto_next, description = 'Go to next diagnostic' },
    { '==', vim.lsp.buf.format, description = 'Format buffer' },

    -- toggleterm
    { '<c-t>t', ':ToggleTerm<cr>', description = 'Toggle terminal' },
    { '<c-t>h', ':ToggleTerm dir="%:p:h"<cr>', description = 'Open terminal in directory of current file' },
    { 't', '<c-n>', '<c-\\><c-N>', description = 'Unfocus terminal' },

    -- codewindow
    { '<leader>mf', codewindow.toggle_focus, description = 'Focus minimap' },
    { '<leader>mm', codewindow.toggle_minimap, description = 'Toggle minimap' },

    -- umlauts
    { '\\A', { i = '<c-K>A:' } },
    { '\\a', { i = '<c-K>a:' } },
    { '\\O', { i = '<c-K>O:' } },
    { '\\o', { i = '<c-K>o:' } },
    { '\\U', { i = '<c-K>U:' } },
    { '\\u', { i = '<c-K>u:' } },
    { '\\s', { i = '<c-K>ss' } },

    -- misc
    { '<leader>o', 'o<esc>k', description = 'Insert empty below' },
    { '<leader>O', 'O<esc>j', description = 'Insert empty above' },
    { '<leader>uw', 'gUiWe', description = 'Uppercase word' },
  }
}
