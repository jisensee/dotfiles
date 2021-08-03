" LEADER
nnoremap <SPACE> <Nop>
let mapleader = ' '

" COPY & PAST
nnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG``
nnoremap <Leader>p "+p
nnoremap Y y$

" SAVING, QUITTING
nnoremap <Leader>s :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>

" UPPERCASE WORD
nnoremap <Leader>uw gUiWe

" INSERT LINE
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j

" WINDOW NAVIVGATION
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" change working dir to current buffer
nnoremap <Leader>d :cd %:p:h<CR>

" Center when searching
nnoremap n nzz
nnoremap N Nzz

" NERDTREE
nnoremap <Leader>r :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

" TELESCOPE
nnoremap <Leader><Leader> <cmd>Telescope git_files<CR>
nnoremap <Leader>f <cmd>Telescope find_files<CR>

nnoremap <Leader>g <cmd>Telescope live_grep<CR>
nnoremap <Leader>f <cmd>Telescope buffers<CR>

" UMLAUTS
inoremap \A <C-K>A:
inoremap \a <C-K>a:

inoremap \O <C-K>O:
inoremap \o <C-K>o:

inoremap \U <C-K>U:
inoremap \u <C-K>u:

inoremap \s <C-K>s
