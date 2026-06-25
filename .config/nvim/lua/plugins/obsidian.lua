return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.compat",
      "nvim-telescope/telescope.nvim",
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
        date_format = "%Y/%m/%Y-%m-%d",
        template = "daily-note-template.md",
        default_tags = { "daily-note" },
      },

      templates = {
        folder = "templates",
      },

      picker = {
        name = "telescope.nvim",
      },

      ui = { enable = false },

      -- Only manage `created` / `updated`; leave every other field as typed.
      -- (obsidian still re-serializes the YAML block in a fixed key order on save.)
      note_frontmatter_func = function(note)
        local out = {}

        -- Carry over every custom frontmatter key untouched.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        -- Preserve obsidian's managed fields (drop empty aliases/tags so they
        -- aren't injected into notes that don't use them).
        out.id = note.id
        if note.aliases ~= nil and #note.aliases > 0 then
          out.aliases = note.aliases
        end
        if note.tags ~= nil and #note.tags > 0 then
          out.tags = note.tags
        end

        -- The only fields we actively manage: stamp `created` once, bump
        -- `updated` on every save. Format matches the second-brain vault.
        local now = os.date("%Y-%m-%dT%H:%M")
        out.created = out.created or now
        out.updated = now

        return out
      end,
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
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "obsidian",
          "obsidian_new",
          "obsidian_tags",
          "obsidian_fm_tags",
        },
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
