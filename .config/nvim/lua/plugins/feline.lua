local function make_statusline_comps()
  local vi_mode_provider = require 'feline.providers.vi_mode'
  local left = {
    {
      provider = '   ',
      hl = function()
        return { bg = vi_mode_provider.get_mode_color() }
      end,
    },
    {
      provider = 'vi_mode',
      hl = function()
        return {
          name = vi_mode_provider.get_mode_highlight_name(),
          bg = vi_mode_provider.get_mode_color(),
          fg = 'black',
          style = 'bold',
        }
      end,
      icon = '',
    },
    {
      provider = '  ',
      hl = function()
        return { bg = vi_mode_provider.get_mode_color() }
      end,
      right_sep = { 'slant_right_2' },
    },
    {
      provider = 'macro',
      hl = { bg = 'orange', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = ' '
    }
  }

  local right = {
    {
      provider = 'git_diff_added',
      hl = {
        bg = 'green',
        fg = 'black',
      },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'git_diff_changed',
      hl = {
        bg = 'skyblue',
        fg = 'black',
      },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'git_diff_removed',
      hl = {
        bg = 'red',
        fg = 'black',
      },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'git_branch',
      hl = {
        bg = 'violet',
        fg = 'black',
      },
      left_sep = 'slant_left',
    }
  }

  return { left, right }
end

local function make_winbar_comps(active)
  local left = {
    { provider = '   ', hl = { bg = active and 'violet' } },
    {
      provider = 'file_info',
      hl = {
        style = active and 'bold' or 'NONE',
        bg = active and 'violet',
        fg = active and 'black' or 'white',
      },
      opts = {
        type = 'unique',
        colored_icon = false,
      }
    },
    {
      provider = '   ',
      hl = { bg = active and 'violet' },
      right_sep = { 'slant_right_2' }, ''
    },
    {
      provider = 'diagnostic_errors',
      hl = { bg = 'red', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'diagnostic_warnings',
      hl = { bg = 'yellow', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'diagnostic_info',
      hl = { bg = 'cyan', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'diagnostic_hints',
      hl = { bg = 'skyblue', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = ' ',
    }
  }

  local right = {
    {
      provider = ' ',
      hl = { bg = 'cyan' },
      left_sep = 'slant_left'
    },
    {
      provider = 'file_type',
      hl = { bg = 'cyan', fg = 'black' },
      right_sep = { 'slant_right_2' },
    },
    {
      provider = 'file_size',
      hl = { bg = 'cyan', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = { 'slant_right_2' },
    },
    {
      provider = 'position',
      hl = { bg = 'skyblue', fg = 'black' },
      left_sep = 'slant_left',
    },
    { provider = ' ' },
    {
      provider = 'scroll_bar',
      right_sep = ' ',
      hl = { fg = 'violet' },
      opts = {
        reverse = false,
      }
    }
  }

  return { left, right }
end

return {
  'feline-nvim/feline.nvim',
  dependencies = { 'lewis6991/gitsigns.nvim' },
  config = function()
    local colors = require 'dracula'.colors()
    local disabled_config = {
      filetypes = {
        'NvimTree',
      },
      buftypes = {
        'terminal',
      },
    }
    local theme = {
      fg = colors.fg,
      bg = colors.bg,
      black = colors.black,
      skyblue = colors.black,
      cyan = colors.cyan,
      green = colors.green,
      oceanblue = colors.black,
      magenta = colors.purple,
      orange = colors.orange,
      red = colors.red,
      violet = colors.pink,
      white = colors.white,
      yellow = colors.yellow,
    }
    require 'feline'.use_theme(theme)
    require 'feline'.setup {
      components = {
        active = make_statusline_comps(),
      },
      disable = disabled_config,
    }
    require 'feline'.winbar.setup {
      components = {
        active = make_winbar_comps(true),
        inactive = make_winbar_comps(false),
      },
      disable = disabled_config,
    }
  end
}
