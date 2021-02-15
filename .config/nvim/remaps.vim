" LEADER
nnoremap <SPACE> <Nop>
let mapleader = ' '

" CLIPBOARD
nnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG``
nnoremap <Leader>p "+p

" SAVING, QUITTING
nnoremap <Leader>s :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>

" INSERT LINE
nnoremap <Leader>o o<Esc>k

" TERMINAL
nnoremap <Leader>t :term<CR>

" UMLAUTS
inoremap \A <C-K>A:
inoremap \a <C-K>a:

inoremap \O <C-K>O:
inoremap \o <C-K>o:

inoremap \U <C-K>U:
inoremap \u <C-K>u:

inoremap \s <C-K>s
