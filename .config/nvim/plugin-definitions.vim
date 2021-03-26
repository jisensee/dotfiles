call plug#begin('~/vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'justinmk/vim-sneak'
Plug 'bkad/camelcasemotion'
Plug 'rstacruz/vim-closer'
Plug 'psliwka/vim-smoothie'
Plug 'wellle/targets.vim'

Plug 'airblade/vim-gitgutter'

Plug 'sheerun/vim-polyglot'
Plug 'uiiaoo/java-syntax.vim'
Plug 'kevinoid/vim-jsonc'

Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'glacambre/firenvim', {'do': { _ -> firenvim#install(0) }}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'ThePrimeagen/vim-be-good'

Plug 'dracula/vim'

call plug#end()

colorscheme dracula

