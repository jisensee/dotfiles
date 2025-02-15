return {
  'L3MON4D3/LuaSnip',
  cond = not vim.g.started_by_firenvim,
  config = function()
    require('luasnip.loaders.from_lua').load { paths = { './snippets' } }
    local ls = require 'luasnip'
    ls.filetype_extend('typescriptreact', { 'typescript' })
  end,
}
