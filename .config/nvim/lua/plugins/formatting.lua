local function is_rhino_core(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  return path:find('rhino-core', nil, true) ~= nil
end

local function is_rhino_frontend(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  return path:find('services/webapp', nil, true) ~= nil or path:find 'shared-ui'
end

local jsFormatters = function(bufnr)
  if is_rhino_core(bufnr) and not is_rhino_frontend(bufnr) then
    return { 'dprint' }
  elseif is_rhino_core(bufnr) then
    return {
      -- 'eslint_d',
      'dprint_prettier',
    }
  else
    return {
      'eslint_d',
      'prettier',
    }
  end
end

return {
  {
    'stevearc/conform.nvim',
    cond = not vim.g.started_by_firenvim,
    opts = {
      log_level = vim.log.levels.DEBUG,
      format_on_save = {
        timeout_ms = 2500,
        lsp_fallback = true,
      },
      formatters = {
        yarn_prettier = {
          command = 'yarn',
          args = { 'prettier', '--write', '$FILENAME' },
          stdin = false,
        },
        dprint_prettier = {
          command = 'dprint-prettier',
          args = { 'fmt', '--stdin', '$FILENAME' },
        },
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = jsFormatters,
        javascriptreact = jsFormatters,
        typescript = jsFormatters,
        typescriptreact = jsFormatters,
      },
    },
  },
}
