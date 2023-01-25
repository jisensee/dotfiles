local function lsp_format()
  vim.lsp.buf.format({
    timeout_ms = 3000,
    filter = function(client)
      local filetype = vim.bo.filetype
      local nls_sources = require 'null-ls.sources'.get_available(filetype, 'NULL_LS_FORMATTING')
      local has_nls_source = #nls_sources > 0

      if has_nls_source then
        return client.name == 'null-ls'
      end
      return true
    end,
  })
end

-- generic format on save with lsp
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { "*.*" },
  callback = lsp_format,
})

return {
  make_ktfmt_source = function(nls, nls_helpers)
    return {
      name = 'ktfmt',
      method = nls.methods.FORMATTING,
      filetypes = { 'kotlin' },
      generator = nls_helpers.formatter_factory({
        command = 'ktfmt',
        to_stdin = true,
      })
    }
  end
}
