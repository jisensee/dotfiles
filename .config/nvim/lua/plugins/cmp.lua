local cmp = require 'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }
  }),
  windown = {
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<up>'] = cmp.mapping.select_prev_item(),
    ['<down>'] = cmp.mapping.select_next_item(),
    ['<tab>'] = cmp.mapping.confirm({ select = true }),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
    ['<c-space>'] = cmp.mapping.complete(),
    ['<c-a>'] = cmp.mapping.abort(),
  })
})
