" CAMEL CASE MOTION
let g:camelcasemotion_key = '<leader>'

nnoremap <Leader>d :cd %:p:h<CR>

" NERDTREE
nnoremap <Leader>r :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>


" TELESCOPE
nnoremap <Leader><Leader> <cmd>Telescope git_files<CR>
nnoremap <Leader>f <cmd>Telescope find_files<CR>

nnoremap <Leader>g <cmd>Telescope live_grep<CR>
nnoremap <Leader>h <cmd>Telescope buffers<CR>

lua << EOF
require('telescope').setup{
  defaults = {
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
  }
}
EOF

" RAINBOW PARENS
let g:rainbow#pairs = [['(', ')',], ['[', ']'], ['{', '}']]
autocmd VimEnter * RainbowParentheses

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
