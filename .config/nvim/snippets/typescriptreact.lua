local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local fmta = require('luasnip.extras.fmt').fmta
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

local function first_line(args) return args[1][1] end

return {
  s(
    'us',
    fmta('const [<var_name>, set<setter>] = useState(<initial>)', {
      var_name = i(1),
      initial = i(2),
      setter = f(fp.make_pipe { first_line, str.capitalize }, { 1 }),
    })
  ),
  s(
    'ue',
    fmta(
      [[
    useEffect(() =>> {
      <body>
    }, [<deps>])
    ]],
      {
        body = i(1),
        deps = i(2),
      }
    )
  ),
  s(
    'rc',
    fmta(
      [[
    type <comp_name>Props = {
      <props_def>
    }

    const <comp_name> = ({ <props> }: <comp_name>Props) =>> 
  ]],
      {
        comp_name = i(1),
        props_def = i(2),
        props = f(parse_prop_def, { 2 }),
      },
      { repeat_duplicates = true }
    )
  ),
  s(
    'np',
    fmta(
      [[
  export default async function <name>Page() {
    <body>
  }
  ]],
      {
        name = i(1),
        body = i(2),
      }
    )
  ),
}
