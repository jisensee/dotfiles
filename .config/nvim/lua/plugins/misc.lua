local function toggle_telescope(harpoon_files)
  local conf = require('telescope.config').values
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

return {
  {
    'rmagatti/auto-session',
    cond = not vim.g.started_by_firenvim,
    config = true,
  },
  {
    'ellisonleao/glow.nvim',
    cond = not vim.g.started_by_firenvim,
    event = 'VeryLazy',
    config = true,
  },
  'romainl/vim-cool',
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        names = false,
        tailwind = true,
      },
    },
    config = true,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'rcarriga/nvim-notify',
      'nvim-lua/plenary.nvim',
    },
    cond = not vim.g.started_by_firenvim,
    keys = {
      {
        '<leader>a',
        function()
          require('harpoon'):list():add()

          local notify = require 'notify'
          notify('Added file to harpoon', 'info', { title = 'Harpoon' })
        end,
        desc = 'Add file to harpoon',
      },
      {
        '<leader>m',
        function() toggle_telescope(require('harpoon'):list()) end,
        desc = 'Open marked files in telescope',
      },
      {
        '<C-h>',
        function()
          require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
        end,
        desc = 'Open marked files in harpoon ui',
      },
    },
    config = function() require('harpoon'):setup() end,
  },
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    keys = {
      {
        '<leader>D',
        function() require('dbee').toggle() end,
        desc = 'Toggle dbee',
      },
    },
    build = function() require('dbee').install() end,
    config = true,
  },
  {
    'jisensee/abc.nvim',
    config = function() require('abc-nvim').setup() end,
    ft = 'abc',
  },
}
