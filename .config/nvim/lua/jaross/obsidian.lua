-- Enable concealed Markdown syntax for Obsidian.
-- 0 = Show all Markdown syntax
-- 1 = Conceal syntax unless it has a replacement character
-- 2 = Conceal Markdown syntax when appropriate
vim.opt.conceallevel = 2

require("obsidian").setup({
  -- Disable deprecated Obsidian commands.
  -- Old: :ObsidianBacklinks
  -- New: :Obsidian backlinks
  -- Legacy commands will be removed in obsidian.nvim 4.0.
  legacy_commands = false,
  workspaces = {
    {
      name = "msft-obsidian",
      path = "~/obsidian",
    },
  },
})

-- Automatically update the "updated" frontmatter property
-- whenever an existing Markdown note is saved.

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.md",
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    -- Only modify files that contain YAML frontmatter.
    if lines[1] ~= "---" then
      return
    end

    local today = os.date("%Y-%m-%d")

    for i = 2, #lines do
      -- Stop at the end of the YAML frontmatter.
      if lines[i] == "---" then
        break
      end

      if lines[i]:match("^updated:") then
        vim.api.nvim_buf_set_lines(
          0,
          i - 1,
          i,
          false,
          { "updated: " .. today }
        )
        break
      end
    end
  end,
})
