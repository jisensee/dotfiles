local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require 'luasnip.extras.fmt'.fmta
local postfix = require 'luasnip.extras.postfix'.postfix
local fp = require 'util.fp'
local list = require 'util.list'

local extract_plugin_name = fp.make_pipe {
  fp.curry(string.gmatch, 'https://github.com/(.+)'),
  list.from_iterator,
  list.first,
}

return {
  postfix({
    trig = '.lp',
    match_pattern = 'https://github.com/.+$',
  },
    fmta([[
{
  '<name>',
  config = <config>,
},
    ]], {
      config = i(1),
      name = f(function(_, parent)
        return extract_plugin_name(parent.snippet.env.POSTFIX_MATCH)
      end, {}),
    })
  )
}
