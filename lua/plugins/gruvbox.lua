return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    init = function()
      vim.cmd("colorscheme gruvbox")
    end,
    opts = {
      dim_inactive = { enabled = true, percentage = 0.25 },
      transparent_mode = false,
      highlight_overrides = {
        default = function(colors)
          return {
            Normal = { bg = colors.dark0 },
            Comment = { fg = colors.gray },
            SignColumn = { bg = colors.dark0 },
            CursorLine = { bg = colors.dark1 },
            StatusLine = { bg = colors.dark1, fg = colors.light1 },
            Visual = { bg = colors.dark3 },
            NormalFloat = { bg = colors.dark1 },
          }
        end,
      },
    },
  },
}
