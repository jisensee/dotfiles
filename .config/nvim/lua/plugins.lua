require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorschemes
  use 'Mofiqul/dracula.nvim'

  -- lsp base setup
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  -- lsp extensions
  use 'nvim-lua/lsp-status.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'theHamsta/nvim-semantic-tokens'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'
  use 'RRethy/vim-illuminate'
  use {
    'folke/trouble.nvim',
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require 'nvim-treesitter.install'.update({ with_sync = true }) end,
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- editing
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'wellle/targets.vim'
  use 'lukas-reineke/indent-blankline.nvim'

  -- motions
  use 'bkad/camelcasemotion'
  use 'ggandor/leap.nvim'

  -- snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- UI
  use 'declancm/cinnamon.nvim'
  use 'gorbit99/codewindow.nvim'
  use 'goolord/alpha-nvim'
  use { 'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    }
  }
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
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
  use 'stevearc/dressing.nvim'
  use 'ellisonleao/glow.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'mbbill/undotree'

  -- misc
  use { 'jackMort/ChatGPT.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    } }
  use 'mrjones2014/legendary.nvim'
  use 'rmagatti/auto-session'
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
end)

vim.g.camelcasemotion_key = '<leader>'

require 'nvim-autopairs'.setup()
require 'indent_blankline'.setup {
  show_current_context = true,
  show_current_context_start = true,
}
require 'leap'.add_default_mappings()

require 'nvim-ts-autotag'.setup()
require 'cinnamon'.setup({
  default_keymaps = true,
  extra_keymaps = true,
  extended_keymaps = true,
  scroll_limit = 75,
  max_length = 100,
})
require 'plugins.dracula'

if vim.g.started_by_firenvim then
  require 'plugins.firenvim'
else
  require 'plugins.treesitter'
  require 'plugins.lualine'
  require 'plugins.lsp'
  require 'plugins.cmp'
  require 'plugins.telescope'
  require 'plugins.vsnip'
  require 'plugins.symbols_outline'
  require 'plugins.minimap'
  require 'plugins.noice'

  require 'gitsigns'.setup()
  require 'nvim-tree'.setup {
    view = {
      adaptive_size = true
    }
  }
  require 'toggleterm'.setup()
  require 'nvim-lightbulb'.setup { autocmd = { enabled = true } }
  require 'treesitter-context'.setup()
  require 'trouble'.setup {
    auto_open = false,
    auto_close = true,
  }
  require 'alpha'.setup(require 'alpha.themes.startify'.config)
  require 'glow'.setup()
  require 'auto-session'.setup()
  require 'neogit'.setup()
  require 'chatgpt'.setup()

  vim.api.nvim_set_hl(0, 'IlluminatedWordText', {
    bg = "#282A36",
  })
  vim.api.nvim_set_hl(0, 'IlluminatedWordRead', {
    bg = "#282A36",
  })
  vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', {
    bg = "#282A36",
  })
end
