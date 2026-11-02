
-- lua/jaross/neo-tree.lua

require("neo-tree").setup({
  vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree show")
  end,
}),
  close_if_last_window = true,

  popup_border_style = "rounded",

  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
    },

    follow_current_file = {
      enabled = true,
    },

    use_libuv_file_watcher = true,
  },

  window = {
    position = "left",
    width = 35,

    mappings = {
      ["<space>"] = "none",
    },
  },

  default_component_configs = {
    indent = {
      with_expanders = true,
    },
  },
})

