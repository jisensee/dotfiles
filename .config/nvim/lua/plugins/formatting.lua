local jsFormatters = {
  'eslint_d',
  'prettier',
}
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
