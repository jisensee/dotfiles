local M = {}

local List = require 'util.list'

function M.pipe(input, configs)
  return List.reduce(configs, input, function(current, config)
    if type(config) == 'table' then
      local func = table.remove(config, 1)
      return func(current, unpack(config))
    else
      return config(current)
    end
  end)
end

function M.peek(v, label)
  if type(v) == 'table' then
    print(label .. ' = ' .. List.to_string(v))
  else
    print(label .. ' = ' .. v)
  end
  return v
end

function M.pipe_peek(label)
  return { M.peek, label }
end

function M.ternary(condition, if_true, if_false)
  if condition then
    return if_true
  else
    return if_false
  end
end

return M
