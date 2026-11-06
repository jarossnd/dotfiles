
-- Obsidian knowledge base configuration
-- Supports different vault locations on Ubuntu and Arch Linux
-- using the OBSIDIAN_VAULT environment variable.
--
-- Define OBSIDIAN_VAULT in ~/.zshrc.local on each machine.
-- This allows the same Neovim configuration to be shared
-- through Git without hardcoding machine-specific paths.

-- Enable concealed Markdown syntax.
-- 0 = Show all Markdown syntax
-- 1 = Conceal syntax unless it has a replacement character
-- 2 = Conceal Markdown syntax when appropriate
vim.opt.conceallevel = 2

-- Read machine-specific Obsidian settings.
local vault_path = vim.env.OBSIDIAN_VAULT
local workspace_name = vim.env.OBSIDIAN_WORKSPACE

-- Default workspace name if not specified.
if not workspace_name or workspace_name == "" then
  workspace_name = "default"
end

-- Expand ~/ and normalize the path for reliable comparisons.
if vault_path and vault_path ~= "" then
  vault_path = vim.fs.normalize(
    vim.fn.fnamemodify(vault_path, ":p")
  )
end

-- Configure Obsidian only when a vault path is defined.
if vault_path and vault_path ~= "" then
  require("obsidian").setup({
    -- Disable deprecated Obsidian commands.
    -- Old: :ObsidianBacklinks
    -- New: :Obsidian backlinks
    -- Legacy commands will be removed in obsidian.nvim 4.0.
    legacy_commands = false,

    workspaces = {
      {
        name = workspace_name,
        path = vault_path,
      },
    },

    -- Let markview.nvim handle Markdown rendering.
    ui = {
      enable = false,
    },
  })
else
  vim.notify(
    "Obsidian: OBSIDIAN_VAULT is not configured",
    vim.log.levels.WARN
  )
end

-- Automatically update the "updated" frontmatter property
-- whenever an existing Markdown note inside the Obsidian
-- vault is saved.
--
-- Requirements:
--   1. File must be inside the configured Obsidian vault.
--   2. File must contain YAML frontmatter.
--   3. Frontmatter must already contain an "updated" property.
--
-- This does not add missing properties or change files
-- outside the Obsidian vault.

if vault_path and vault_path ~= "" then
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.md",

    callback = function(args)
      local filename = vim.api.nvim_buf_get_name(args.buf)

      if filename == "" then
        return
      end

      -- Normalize the current file path.
      local file_path = vim.fs.normalize(filename)

      -- Only update files inside the Obsidian vault.
      -- The trailing slash prevents matching similarly named
      -- directories outside the vault.
      local vault_prefix = vault_path:gsub("/+$", "") .. "/"

      if file_path:sub(1, #vault_prefix) ~= vault_prefix then
        return
      end

      -- Read the current buffer.
      local lines = vim.api.nvim_buf_get_lines(
        args.buf, 0, -1, false
      )

      -- Only modify files that contain YAML frontmatter.
      if lines[1] ~= "---" then
        return
      end

      local today = os.date("%Y-%m-%d")

      -- Search only within the frontmatter block.
      for i = 2, #lines do
        -- Stop at the closing frontmatter delimiter.
        if lines[i] == "---" then
          break
        end

        -- Update the existing property.
        if lines[i]:match("^updated:%s*") then
          local new_line = "updated: " .. today

          -- Avoid modifying the buffer unnecessarily.
          if lines[i] ~= new_line then
            vim.api.nvim_buf_set_lines(
              args.buf,
              i - 1,
              i,
              false,
              { new_line }
            )
          end

          break
        end
      end
    end,
  })
end

