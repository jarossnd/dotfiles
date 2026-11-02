-- ~/.config/nvim/lua/jaross/plugins.lua

local gh = function(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  -- Colorscheme
  { src = gh("catppuccin/nvim"), name = "catppuccin" },
    -- GitHub Copilot
  gh("github/copilot.vim"),
  gh("CopilotC-Nvim/CopilotChat.nvim"),
})

vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})
