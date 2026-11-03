-- Custom Markdown colors for Neovim and Markview.
-- Catppuccin Mocha-inspired palette.

local function apply_markdown_colors()
  local hl = vim.api.nvim_set_hl

  -- Headings
  hl(0, "MarkviewHeading1", { fg = "#89B4FA", bold = true })
  hl(0, "MarkviewHeading2", { fg = "#94E2D5", bold = true })
  hl(0, "MarkviewHeading3", { fg = "#B4BEFE", bold = true })
  hl(0, "MarkviewHeading4", { fg = "#A6E3A1", bold = true })
  hl(0, "MarkviewHeading5", { fg = "#F9E2AF", bold = true })
  hl(0, "MarkviewHeading6", { fg = "#89DCEB", bold = true })

  -- Bold text
  hl(0, "@markup.strong", {
    fg = "#CDD6F4",
    bold = true,
  })

  hl(0, "@markup.strong.markdown_inline", {
    fg = "#CDD6F4",
    bold = true,
  })
end

-- Apply colors when Neovim starts.
apply_markdown_colors()

-- Reapply colors when the colorscheme changes.
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.schedule(apply_markdown_colors)
  end,
})
