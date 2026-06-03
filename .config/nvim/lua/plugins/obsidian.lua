return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.compat",
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
        template = "daily-note-template.md",
        default_tags = {},
      },

      templates = {
        folder = "templates",
      },

      ui = { enable = false },
      mappings = {
        -- toggle checkboxes
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
  },

  {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.compat" },
    opts = {
      keymap = {
        preset = "default",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-n>"] = {},
        ["<C-p>"] = {},
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "obsidian", "obsidian_new", "obsidian_tags", "obsidian_fm_tags" },
        providers = {
          obsidian = { name = "obsidian", module = "blink.compat.source" },
          obsidian_new = { name = "obsidian_new", module = "blink.compat.source" },
          obsidian_tags = { name = "obsidian_tags", module = "blink.compat.source" },
          obsidian_fm_tags = {
            name = "obsidian_fm_tags",
            module = "blink_sources.obsidian_fm_tags",
            min_keyword_length = 0,
          },
          buffer = {
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                -- drop long hash-like tokens (excalidraw/base64 noise)
                return not (#item.label > 20 and item.label:match("^[A-Za-z0-9+/=_-]+$"))
              end, items)
            end,
          },
        },
      },
    },
  },
}
