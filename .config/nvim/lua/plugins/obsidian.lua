return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "caremaze",
        path = "~/Obsidian/caremaze",
      },
      {
        name = "obsidian-vault-template",
        path = "~/Obsidian/obsidian-vault-template",
      },
      {
        name = "second-brain",
        path = "~/Obsidian/second-brain",
      },
    },

    daily_notes = {
      folder = "daily",
    },

    ui = { enable = false },
    mappings = {
      ["<leader>ch"] = {
        action = function()
          local line = vim.api.nvim_get_current_line()
          local new_line
          if line:match("%[x%]") then
            new_line = line:gsub("%[x%]", "[ ]", 1)
          elseif line:match("%[.%]") then
            new_line = line:gsub("%[.%]", "[x]", 1)
          end
          if new_line then
            vim.api.nvim_set_current_line(new_line)
          end
        end,
        opts = { buffer = true },
      },
    },
    checkboxes = {
      [" "] = { order = 1, char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { order = 2, char = "", hl_group = "ObsidianDone" },
    },
  },
}
