local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require 'luasnip.extras.fmt'.fmta

return {
  s('lp',
    fmta([[
{
  '<name>',
  config = <config>,
}
  ]] , {
      name = i(1, 'plugin name'),
      config = i(2, 'plugin config'),
    })
  ),
}
