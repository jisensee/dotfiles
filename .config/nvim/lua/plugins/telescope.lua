require'telescope'.setup {
  defaults = {
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
  }
}
