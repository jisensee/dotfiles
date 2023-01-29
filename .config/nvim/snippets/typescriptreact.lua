local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local fmta = require 'luasnip.extras.fmt'.fmta
local fp = require 'util.fp'
local list = require 'util.list'
local str = require 'util.string'

local function parse_prop_def(args)
  return fp.pipe(args[1], {
    { list.join, '' },
    { string.gmatch, '([%a%d]+):' },
    list.from_iterator,
    { list.join, ', ' },
  })
end

return {
  s('us', {
    t 'const [', i(1),
    f(function(args)
      local var_name = args[1][1]
      return ', set' .. str.capitalize(var_name)
    end, { 1 }),
    t '] = useState(', i(2), t ')'
  }),
  s('rc', fmta([[
    type <comp_name>Props = {
      <props_def>
    }

    const <comp_name>:FC<<<comp_name>Props>> = ({ <props> }) =>> 
  ]], {
    comp_name = i(1),
    props_def = i(2),
    props = f(parse_prop_def, { 2 })
  }, { repeat_duplicates = true })
  )
}
