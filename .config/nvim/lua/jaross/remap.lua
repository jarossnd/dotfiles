--- Set leader key to spacebar
vim.g.mapleader = " "

--- Exit on jj and jk
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

--- Exit on jj and jk
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')

-- Toggle Neo-tree using Space + E
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
  desc = "Toggle Neo-tree file explorer",
  silent = true,
})


-- Navigate between Neovim windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Navigate directly from terminal mode
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Terminal to left window" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Terminal to lower window" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Terminal to upper window" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Terminal to right window" })

-- Exit terminal mode with Escape
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
  desc = "Exit terminal mode",
})

-- Open terminal at bottom
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("botright 12new")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, {
  desc = "Open terminal at bottom",
  silent = true,
})

-- Obsidian Knowledge Base
local map = vim.keymap.set

-- Create a new technical note
map("n", "<leader>on", "<cmd>Obsidian new<CR>", {
  desc = "Obsidian: New note",
})

-- Search all notes
map("n", "<leader>os", "<cmd>Obsidian search<CR>", {
  desc = "Obsidian: Search notes",
})

-- Quickly switch between notes
map("n", "<leader>of", "<cmd>Obsidian quick_switch<CR>", {
  desc = "Obsidian: Find note",
})

-- Show backlinks for the current note
map("n", "<leader>ob", "<cmd>Obsidian backlinks<CR>", {
  desc = "Obsidian: Backlinks",
})

-- Insert a template
map("n", "<leader>ot", "<cmd>Obsidian template<CR>", {
  desc = "Obsidian: Insert template",
})

-- Open note in Obsidian desktop application
map("n", "<leader>oo", "<cmd>Obsidian open<CR>", {
  desc = "Obsidian: Open in desktop app",
})

-- Obsidian: Add or update frontmatter properties
vim.keymap.set("n", "<leader>op", function()
  vim.lsp.buf.code_action()
end, {
  desc = "Obsidian: Frontmatter properties",
  silent = true,
})

-- Display spelling/grammar issue under cursor
vim.keymap.set("n", "<leader>gd", function()
  vim.diagnostic.open_float()
end, { desc = "Show grammar diagnostic" })

-- Show suggested corrections
vim.keymap.set("n", "<leader>ga", function()
  vim.lsp.buf.code_action()
end, { desc = "Grammar suggestions" })

-- Jump to next issue
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

-- Jump to previous issue
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })


-- Toggle Markdown preview with Space + M
vim.keymap.set("n", "<leader>m", "<cmd>Markview<CR>", {
  desc = "Toggle Markdown preview",
  silent = true,
})
