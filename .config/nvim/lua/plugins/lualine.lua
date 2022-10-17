require 'lualine'.setup {
  options = {
    globalstatus = false,
    theme = 'dracula',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diagnostics' },
    lualine_c = { 'diff', 'branch' },
    lualine_x = { { 'filename', path = 1 } },
    lualine_y = { 'encoding', 'fileformat', 'filetype' },
    lualine_z = { 'progress', 'location' }
  },
}
