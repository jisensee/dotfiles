return {
  {
    'glacambre/firenvim',
    build = function() vim.fn['firenvim#install'](0) end,
    config = function()
      vim.g.firenvim_config = {
        globalSettings = {},
        localSettings = {
          ['.*'] = {
            priority = 0,
            takeover = 'never',
          },
        },
      }
    end
  }
}
