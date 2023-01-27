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
  local function switch_active(on_active, on_inactive) return active and on_active or on_inactive end

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
        style = active and 'bold' or 'NONE',
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
      hl = { bg = switch_active('skyblue'), fg = file_fg },
      left_sep = 'slant_left',
      right_sep = 'slant_right_2',
    },
    {
      provider = 'file_size',
      hl = { bg = switch_active('skyblue'), fg = file_fg },
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
  config = function()
    local colors = require 'dracula'.colors()
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
    }
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
