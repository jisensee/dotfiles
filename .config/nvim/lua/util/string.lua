local M = {}

function M.capitalize(str)
  return str:gsub('^%l', string.upper)
end

return M
