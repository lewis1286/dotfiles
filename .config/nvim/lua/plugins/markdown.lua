return {
  -- In-editor rendering: conceals syntax, pretty headers/lists/checkboxes
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    opts = {
      -- LazyVim's markdown extra disables both of these; restore them here.
      heading = {
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      checkbox = {
        enabled = true,
        checked = { icon = "✔ " },
      },
    },
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
