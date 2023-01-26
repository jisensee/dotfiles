-- line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- tab handling
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- search
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false

-- swap & undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.undofile = true

-- misc
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.signcolumn = 'yes:2'
vim.opt.updatetime = 500

vim.diagnostic.config {
  virtual_text = true,
}
