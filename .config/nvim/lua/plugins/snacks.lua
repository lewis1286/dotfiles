return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      terminal = {},
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
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
