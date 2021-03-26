" CAMEL CASE MOTION
let g:camelcasemotion_key = '<leader>'

" TELESCOPE
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

" GITGUTTER
let g:gitgutter_map_keys = 0
