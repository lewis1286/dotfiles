return {
  -- In-editor rendering: conceals syntax, pretty headers/lists/checkboxes
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    opts = function(_, defaults)
      defaults.checkbox = {
        enabled = true,
        unchecked = { icon = "☐ " },
        checked = { icon = "✔ " },
      }
      defaults.heading = {
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      }
      -- defaults.anti_conceal = {
      --   enabled = false,
      -- }
      return defaults
    end,
  },

  -- Disable LSP (marksman) for markdown files
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = { enabled = false },
      },
    },
  },

  { "iamcco/markdown-preview.nvim", enabled = false },

  -- Auto-continue bullets/todos on <CR> and o/O
  {
    "dkarter/bullets.vim",
    ft = { "markdown", "text", "gitcommit" },
  },

  -- Remove markdownlint from nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
}
