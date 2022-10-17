-- generic format on save with lsp
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { "*.*" },
  callback = function()
    if vim.bo.filetype == 'kotlin' then
      return
    end
    vim.cmd [[
      if exists(":EslintFixAll")
        EslintFixAll
      endif
    ]]
    vim.lsp.buf.format({ async = false })
  end
})

-- special kotlin format on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { "*.kt" },
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd [[:%! java -jar ~/ktfmt.jar -]]
    vim.fn.winrestview(view)
  end
})
