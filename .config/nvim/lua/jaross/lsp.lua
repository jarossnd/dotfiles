-- LTeX+ spelling and grammar checking for Markdown and Obsidian.

vim.lsp.config("ltex_plus", {
  settings = {
    ltex = {
      language = "en-US",

      enabled = {
        "markdown",
        "text",
      },

      checkFrequency = "edit",
    },
  },

  -- Initialize ltex_extra when LTeX+ attaches.
  -- Handles dictionary additions, disabled rules,
  -- and false-positive exclusions.
  on_attach = function(client, bufnr)
    require("ltex_extra").setup({
      load_langs = { "en-US" },

      -- Load previously saved dictionary entries.
      init_check = true,

      -- Store custom dictionary and rules persistently.
      path = vim.fn.stdpath("config") .. "/ltex",
    })
  end,
})

-- Enable LTeX+ for supported file types.
vim.lsp.enable("ltex_plus")
