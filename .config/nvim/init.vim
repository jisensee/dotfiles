set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

set nu rnu
set expandtab
set smartindent
set shiftwidth=2
set tabstop=2
set cursorline
set autoindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=8

" PLUGINS
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

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'glacambre/firenvim', {'do': { _ -> firenvim#install(0) }}

Plug 'dracula/vim'

call plug#end()

colorscheme dracula

" LEADER
nnoremap <SPACE> <Nop>
let mapleader = ' '

" CAMEL CASE MOTION
let g:camelcasemotion_key = '<leader>'

" NERDTREE
nnoremap <Leader>f :NERDTreeToggle<Enter>

" RAINBOW PARENS
let g:rainbow#pairs = [['(', ')',], ['[', ']'], ['{', '}']]
autocmd VimEnter * RainbowParentheses

" CLIPBOARD
nnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG``
nnoremap <Leader>p "+p

" SAVING, QUITTING
nnoremap <Leader>s :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e!<CR>

" FZF
nnoremap <C-p> :GFiles<CR>
inoremap <C-p> <Esc>:GFiles<CR>

" INSERT LINE
nnoremap <Leader><Leader> o<Esc>k

" UMLAUTS
inoremap \A <C-K>A:
inoremap \a <C-K>a:

inoremap \O <C-K>O:
inoremap \o <C-K>o:

inoremap \U <C-K>U:
inoremap \u <C-K>u:

inoremap \s <C-K>s

" FIRENVIM
if exists('g:started_by_firenvim')
  let g:firenvim_config = { 
    \ 'globalSettings': {},
    \ 'localSettings': {
        \ '.*': {
            \ 'priority': 0,
            \ 'takeover': 'never',
        \ },
    \ }
\ }
endif
