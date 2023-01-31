local M = {}

function M.curry(func, args)
  return function(arg)
    if type(args) == 'table' then
      return func(arg, unpack(args))
    else
      return func(arg, args)
    end
  end
end

function M.make_pipe(configs)
  return M.curry(M.pipe, { configs })
end

function M.pipe(input, configs)
  local current = input
  for _, config in pairs(configs) do
    if type(config) == 'table' then
      local func = table.remove(config, 1)
      current = func(current, unpack(config))
    else
      current = config(current)
    end
  end
  return current
end

function M.peek(value, label)
  if type(value) == 'table' then
    local str_table = '['
    for index, str in ipairs(value) do
      if index == 1 then
        str_table = str_table .. str
      else
        str_table = str_table .. ', ' .. str
      end
    end
    print(label .. ' = ' .. str_table .. ']')
  else
    print(label .. ' = ' .. value)
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
