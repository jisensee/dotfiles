return {
  {
    'echasnovski/mini.files',
    version = '*',
    config = true,
    keys = {
      {
        '<leader>t',
        ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>',
      },
    },
  },
}
