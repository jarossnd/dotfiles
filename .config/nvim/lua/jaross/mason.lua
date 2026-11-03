-- Mason manages external language servers, formatters, and linters.
-- It installs tools independently of the operating system's package manager.
--
-- This allows the same Neovim configuration to work across
-- Arch Linux, Ubuntu, and other operating systems.

require("mason").setup({
  ui = {
    border = "rounded",
  },
})
