return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      terminal = {},
      explorer = {
        preview = true,
      },
      picker = {
        -- Drop grep hits on lines that are one long unbroken token (no spaces) —
        -- characteristic of base64/compressed JSON embedded by Excalidraw.
        -- item.line is lazy (populated inside item.resolve), so resolve first.
        transform = function(item)
          Snacks.picker.util.resolve(item)
          local line = item.line
          if line and #line > 200 and not line:find(" ") then
            return false
          end
          return item
        end,
        sources = {
          explorer = {
            hidden = true,   -- show dotfiles (.env, etc.)
            ignored = true,  -- show gitignored files (jasper.db, kb/, etc.)
            git_status = false,
          },
          files = { hidden = true },
          grep = {
            hidden = true,
            args = {
              "--glob=!*.excalidraw.md",
              "--glob=!*.excalidraw",
              "--glob=!.obsidian/themes/**",
              "--glob=!.obsidian/plugins/**",
              "--glob=!.obsidian/*.js",
            },
          },
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys" },
          -- { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 1, 1 } },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = [[
░  ░░░░░░░░        ░░  ░░░░  ░░       ░░░░      ░░░░      ░░
▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒  ▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒
▓  ▓▓▓▓▓▓▓▓      ▓▓▓▓        ▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓  ▓▓  ▓▓▓   ▓
█  ████████  ████████   ██   ██  ████  ██  ████  ██  ████  █
█        ██        ██  ████  ██       ████      ████      ██
           ]],
        },
        -- your dashboard configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
  },
}
