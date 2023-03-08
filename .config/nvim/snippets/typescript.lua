local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

return {
  s(
    'im',
    fmta("import { <symbol> } from '<package>'", {
      symbol = i(2),
      package = i(1),
    })
  ),
  s(
    'ty',
    fmta(
      [[
  type <type_name> = {
    <type_def>
  }
  ]],
      {
        type_name = i(1),
        type_def = i(2),
      }
    )
  ),
  s(
    'it',
    fmta(
      [[
  it('<description>', () =>> {
    <body>
  })
  ]],
      {
        description = i(1),
        body = i(2),
      }
    )
  ),
}
