local function comp(provider_name, provider_opts, icon)
  return {
    provider = {
      name = provider_name,
      opts = provider_opts,
    },
    icon = icon,
  }
end

local comps = {
  mode                = comp('vi_mode', {}, ''),
  file_info           = comp('file_info'),
  file_relative_path  = comp('file_info', { type = 'relative' }, ''),
  macro               = comp('macro'),
  git_added           = comp('git_diff_added'),
  git_removed         = comp('git_diff_removed'),
  git_changed         = comp('git_diff_changed'),
  diagnostic_errors   = comp('diagnostic_errors'),
  diagnostic_warnings = comp('diagnostic_warnings'),
  diagnostic_hints    = comp('diagnostic_hints'),
  diagnostic_info     = comp('diagnostic_info'),
  scroll_bar          = comp('scroll_bar'),
  position            = comp('position'),
}

local statusline_comps = {
  { comps.mode, comps.macro },
  {
    comps.git_added,
    comps.git_removed,
    comps.git_changed,
    comps.diagnostic_errors,
    comps.diagnostic_warnings,
    comps.diagnostic_info,
    comps.diagnostic_hints,
  },
  { comps.position, comps.scroll_bar },
}

local statusline = {
  active = statusline_comps,
  inactive = statusline_comps,
}

local winbar_comps = {
  { comps.file_info },
  { comps.file_relative_path },
}

local winbar = {
  active = winbar_comps,
  inactive = winbar_comps,
}
return {
  'feline-nvim/feline.nvim',
  dependencies = { 'lewis6991/gitsigns.nvim' },
  config = function()
    require 'feline'.setup {
      -- components = statusline,
    }
    require 'feline'.winbar.setup {
      -- components = winbar,
    }
  end
}
