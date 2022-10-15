vim.cmd [[packadd packer.nvim]]

require 'packer'.startup(function(use)
  use 'Mofiqul/dracula.nvim'
  use 'karb94/neoscroll.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'windwp/nvim-autopairs'
  use 'p00f/nvim-ts-rainbow'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'wellle/targets.vim'
  use 'tpope/vim-repeat'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'bkad/camelcasemotion'
  use 'nvim-lua/lsp-status.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
  use 'lewis6991/gitsigns.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'ggandor/leap.nvim'
  use 'ray-x/lsp_signature.nvim'
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }
  use 'akinsho/toggleterm.nvim'
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
  }
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require 'nvim-treesitter.install'.update({ with_sync = true }) end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
end)

vim.g.camelcasemotion_key = '<leader>'

require 'plugins.dracula'
require 'nvim-autopairs'.setup()
require 'indent_blankline'.setup {
  show_current_context = true,
  show_current_context_start = true,
}
require 'leap'.add_default_mappings()

if vim.g.started_by_firenvim then
  require 'plugins.firenvim'
else
  require 'plugins.neoscroll'
  require 'plugins.treesitter'
  require 'plugins.lualine'
  require 'plugins.lsp'
  require 'plugins.cmp'
  require 'plugins.telescope'
  require 'plugins.vsnip'

  require 'gitsigns'.setup()
  require 'nvim-tree'.setup()
  require 'toggleterm'.setup()
  require 'nvim-lightbulb'.setup { autocmd = { enabled = true } }
  require 'treesitter-context'.setup()
end
