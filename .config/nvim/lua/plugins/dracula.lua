return {
  {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
        selection = "#2f3242",
        comment = "#7a88f2",
        red = "#FF5555",
        orange = "#FFB86C",
        yellow = "#F1FA8C",
        green = "#50fa7b",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        pink = "#FF79C6",
        bright_red = "#FF6E6E",
        bright_green = "#69FF94",
        bright_yellow = "#FFFFA5",
        bright_blue = "#D6ACFF",
        bright_magenta = "#FF92DF",
        bright_cyan = "#A4FFFF",
        bright_white = "#FFFFFF",
        menu = "#21222C",
        visual = "#3E4452",
        gutter_fg = "#4B5263",
        nontext = "#3B4048",
      },
      show_end_of_buffer = false,
      transparent_bg = false,
      lualine_bg_color = "#44475a",
      italic_comment = false,
      -- overrides the default highlights see `:h synIDattr`
      overrides = {
        -- Examples
        -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
        -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        -- Nothing = {} -- clear highlight of Nothing
      }
    },
    config = function(_, opts)
      require 'dracula'.setup(opts)
      vim.cmd [[colorscheme dracula]]
    end

  }
}