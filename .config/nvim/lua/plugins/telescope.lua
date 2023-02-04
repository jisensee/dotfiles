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
        smart_open = {
          show_scores = false,
          max_unindexed = 1000,
          ignore_patterns = {
            '*.git/*',
            '*/tmp/*',
            '**/node_modules/**'
          },
          match_algorithm = "fzy",
          disable_devicons = false,
        },
      },
    }
  }
  telescope.load_extension('smart_open')
end

local function keys()
  local telescope = require 'telescope.builtin'
  local wk = require 'which-key'

  wk.register({
    g = { telescope.live_grep, 'Live grep' },
    ['<leader>'] = { telescope.builtin, 'Telescope pickers' },
  }, { prefix = '<leader>' })
end

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'danielfalk/smart-open.nvim' },
    cond = not vim.g.started_by_firenvim,
    config = function()
      setup()
      keys()
    end
  },
  {
    'danielfalk/smart-open.nvim',
    branch = '0.1.x',
    dependencies = { 'kkharji/sqlite.lua', 'nvim-telescope/telescope.nvim' },
    cond = not vim.g.started_by_firenvim,
    config = function()
      local wk = require 'which-key'
      local telescope = require 'telescope'

      wk.register({
        f = { function() telescope.extensions.smart_open.smart_open({ cwd_only = true }) end,
          'Smart open file in current working directory' },
        F = { telescope.extensions.smart_open.smart_open, 'Smart open file everywhere' },
      }, { prefix = '<leader>' })
    end,
  }
}
