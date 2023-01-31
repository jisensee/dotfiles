local fp = require 'util.fp'

local M = {}

function M.reduce(list, initial, reducer)
  local current = initial
  for index, next in ipairs(list) do
    current = reducer(current, next, index)
  end
  return current
end

function M.join(list, sep)
  return M.reduce(list, '', function(curr, next, curr_index)
    if curr_index == 1 then
      return tostring(curr) .. tostring(next)
    else
      return tostring(curr) .. sep .. tostring(next)
    end
  end)
end

function M.foreach(list, f)
  for i, v in ipairs(list) do
    f(v, i)
  end
  return list
end

function M.to_string(list)
  return '[' .. M.join(list, ', ') .. ']'
end

function M.from_iterator(it)
  local list = {}
  for e in it do
    table.insert(list, e)
  end
  return list
end

function M.get(list, index)
  return list[index]
end

function M.first(list)
  return M.get(list, 1)
end

M.first = fp.curry(M.get, 1)

return M
