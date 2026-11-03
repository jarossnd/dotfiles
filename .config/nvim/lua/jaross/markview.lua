-- Markdown preview configuration
-- Renders Markdown directly inside Neovim.
-- Includes enhanced table rendering with rounded borders.

require("markview").setup({
  preview = {
    -- Use nvim-web-devicons for Markdown icons.
    icon_provider = "devicons",
  },

  markdown = {
    -- Enable Markdown table rendering.
    tables = {
      enable = true,

      -- Ignore surrounding whitespace when calculating cell widths.
      strict = false,

      -- Draw borders around the top and bottom of tables.
      block_decorator = true,

      -- Use regular virtual text instead of virtual lines.
      use_virt_lines = false,

      -- Customize table borders with rounded corners.
      parts = {
        top = { "╭", "─", "╮", "┬" },
        header = { "│", "│", "│" },
        separator = { "├", "─", "┤", "┼" },
        row = { "│", "│", "│" },
        bottom = { "╰", "─", "╯", "┴" },

        overlap = { "┝", "━", "┥", "┿" },

        align_left = "╼",
        align_right = "╾",
        align_center = { "╴", "╶" },
      },
    },
  },
})
