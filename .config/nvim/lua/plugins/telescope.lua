local function setup()
  local actions = require 'telescope.actions'
  local previewers = require 'telescope.previewers'
  local telescope = require 'telescope'

  telescope.setup {
    defaults = {
      file_previewer = previewers.vim_buffer_cat.new,
      mappings = {
        i = {
          ['<esc>'] = actions.close,
        },
      },
      layout_strategy = 'flex',
      layout_config = {
        flex = {
          flip_columns = 150,
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
    extensions = {
      extensions = {
        fzy_native = {
          ovrride_generic_sorter = false,
          ovrride_file_sorter = false,
        },
        smart_open = {
          show_scores = false,
          max_unindexed = 1000,
          ignore_patterns = {
            '*.git/*',
            '*/tmp/*',
            '**/node_modules/**',
          },
          match_algorithm = 'fzy',
          disable_devicons = false,
        },
      },
    },
  }
  telescope.load_extension 'smart_open'
  telescope.load_extension 'fzy_native'
end

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'danielfalk/smart-open.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    keys = {
      {
        '<leader>g',
        function() require('telescope.builtin').live_grep() end,
        desc = 'Live grep',
      },
      {
        '<S-BS>',
        function() require('telescope.builtin').builtin() end,
        desc = 'Telescope pickers',
      },
    },
    cond = not vim.g.started_by_firenvim,
    config = function() setup() end,
  },
  {
    'danielfalk/smart-open.nvim',
    branch = '0.1.x',
    dependencies = { 'kkharji/sqlite.lua', 'nvim-telescope/telescope.nvim' },
    cond = not vim.g.started_by_firenvim,
    keys = {
      {
        '<BS>',
        function() require('telescope').extensions.smart_open.smart_open() end,
        desc = 'Smart open file in current working directory',
      },
    },
  },
}
