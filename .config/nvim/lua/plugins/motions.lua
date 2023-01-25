return {
  'chaoren/vim-wordmotion',
  {
    'ggandor/leap.nvim',
    config = function()
      require 'leap'.add_default_mappings()
    end
  }
}
