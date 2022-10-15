require 'lualine'.setup {
  options = {
    globalstatus = false,
    theme = 'dracula-nvim',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'diff' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
}
