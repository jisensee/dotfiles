return {
  {
    'saghen/blink.cmp',
    version = '*',
    cond = not vim.g.started_by_firenvim,
    opts = {
      cmdline = {
        keymap = {
          ['<Tab>'] = { 'accept' },
          ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
        completion = {
          menu = {
            auto_show = true,
          },
        },
      },
      enabled = function()
        return not vim.tbl_contains({ 'codecompanion' }, vim.bo.filetype)
          and vim.bo.buftype ~= 'prompt'
          and vim.b.completion ~= false
      end,
      completion = {
        documentation = {
          auto_show = true,
        },
        menu = {
          auto_show = function()
            return not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
          end,
        },
      },
      snippets = {
        preset = 'luasnip',
      },
      keymap = {
        preset = 'none',
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<C-e>'] = { function(cmp) cmp.show() end, 'fallback' },
      },
    },
  },
}
