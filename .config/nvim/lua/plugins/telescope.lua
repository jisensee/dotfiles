local actions = require'telescope.actions'

require 'telescope'.setup {
  defaults = {
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
    layout_strategy = 'flex',
    layout_config = {
      flex = {
        flip_columns = 120,
      },
      vertical = {
        mirror = true,
        prompt_position = 'bottom',
      },
      horizontal = {
        prompt_position = 'bottom',
      },
    },
  },
}
