
-- lua/jaross/copilot.lua

-- Keep Tab available for normal completions
vim.g.copilot_no_tab_map = true

-- Accept a Copilot suggestion with Ctrl+J
vim.keymap.set("i", "<C-j>", 'copilot#Accept("")', {
  expr = true,
  replace_keycodes = false,
  silent = true,
  desc = "Accept Copilot suggestion",
})

-- Accept the next word
vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)", {
  desc = "Accept Copilot word",
})

mappings = {
  reset = {
    normal = "<leader>cx",
    insert = "<C-x>",
  },
}
