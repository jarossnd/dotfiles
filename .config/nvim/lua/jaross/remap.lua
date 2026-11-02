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

