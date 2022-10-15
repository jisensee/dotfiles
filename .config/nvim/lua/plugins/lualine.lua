require('lualine').setup({
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics', 'require("lsp-status").status()'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'diff'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
