local M = {}
local List = {}

function List.reduce(list, initial, reducer)
  local current = initial
  for index, next in ipairs(list) do
    current = reducer(current, next, index)
  end
  return current
end

function List.join(list, sep)
  return List.reduce(list, '', function(curr, next, curr_index)
    if curr_index == 1 then
      return tostring(curr) .. tostring(next)
    else
      return tostring(curr) .. sep .. tostring(next)
    end
  end)
end

function List.foreach(list, f)
  for i, v in ipairs(list) do
    f(v, i)
  end
  return list
end

function List.to_string(list)
  return '[' .. List.join(list, ', ') .. ']'
end

function List.from_iterator(it)
  local list = {}
  for e in it do
    table.insert(list, e)
  end
  return list
end

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

M.List = List

return M
