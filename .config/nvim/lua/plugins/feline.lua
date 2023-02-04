local fp = require 'util.fp'

local function make_statusline_comps()
  local vi_mode_provider = require 'feline.providers.vi_mode'
  local left = {
    {
      provider = 'vi_mode',
      icon = '',
      hl = function()
        return {
          name = vi_mode_provider.get_mode_highlight_name(),
          bg = vi_mode_provider.get_mode_color(),
          fg = 'black',
          style = 'bold',
        }
      end,
      left_sep = {
        str = '   ',
        hl = function()
          return { bg = vi_mode_provider.get_mode_color() }
        end,
      },
      right_sep = {
        {
          str = '  ',
          hl = function()
            return { bg = vi_mode_provider.get_mode_color() }
          end,
        },
        'slant_right_2'
      }
    },
    {
      provider = 'macro',
      hl = { bg = 'orange', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative',
          file_modified_icon = '',
          file_readonly_icon = '',
        }
      },
      hl = { bg = 'black' },
      left_sep = {
        'slant_left',
        { str = ' ', hl = { bg = 'black' } }
      },
      right_sep = {
        { str = ' ', hl = { bg = 'black' } },
        'slant_right_2',
      },
      icon = '',
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
      right_sep = {
        str = ' ',
        hl = { bg = 'violet' },
      }
    },
  }

  return { left, right }
end

local function make_winbar_comps(active)
  local function switch_active(on_active, on_inactive)
    return fp.ternary(active, on_active, on_inactive)
  end

  local file_bg = switch_active('violet')
  local file_fg = switch_active('black', 'white')

  local left = {
    { provider = '   ', hl = { bg = file_bg } },
    {
      provider = {
        name = 'file_info',
        opts = {
          type = 'unique',
          colored_icon = false,
        }
      },
      hl = {
        style = 'bold',
        bg = file_bg,
        fg = file_fg,
      },
    },
    {
      provider = '   ',
      hl = { bg = file_bg },
      right_sep = 'slant_right_2',
    },
    {
      provider = 'file_type',
      hl = { bg = switch_active('magenta'), fg = file_fg },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'file_size',
      hl = { bg = switch_active('magenta'), fg = file_fg },
      left_sep = 'slant_left',
      right_sep = { 'slant_right_2' },
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
      hl = { bg = 'blue', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'diagnostic_hints',
      hl = { bg = 'blue', fg = 'black' },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = ' ',
    }
  }

  local right = {
    {
      provider = 'position',
      hl = { bg = 'violet', fg = 'black' },
      left_sep = 'slant_left',
    },
    { provider = ' ', hl = { bg = 'violet' } },
    { provider = ' ' },
    {
      provider = {
        name = 'scroll_bar',
        opts = { reverse = false },
      },
      right_sep = ' ',
      reverse = true,
      hl = { fg = 'violet' },
    }
  }

  return { left, right }
end

return {
  'feline-nvim/feline.nvim',
  dependencies = { 'lewis6991/gitsigns.nvim' },
  cond = not vim.g.started_by_firenvim,
  config = function()
    local colors = require 'dracula'.colors()
    local theme = {
      fg = colors.fg,
      bg = colors.bg,
      black = colors.black,
      blue = colors.cyan,
      cyan = colors.cyan,
      skyblue = colors.bright_cyan,
      green = colors.green,
      oceanblue = colors.cyan,
      magenta = colors.pink,
      orange = colors.orange,
      red = colors.red,
      violet = colors.purple,
      white = colors.bright_white,
      yellow = colors.yellow,
    }
    require 'feline'.setup {
      components = {
        active = make_statusline_comps(),
      },
    }
    require 'feline'.use_theme(theme)
    require 'feline'.winbar.setup {
      components = {
        active = make_winbar_comps(true),
        inactive = make_winbar_comps(false),
      },
      disable = {
        filetypes = { 'NvimTree' },
        buftypes = { 'terminal' },
      },
    }
  end
}
