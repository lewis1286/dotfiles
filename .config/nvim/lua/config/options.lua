-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.opt.fillchars = { vert = "█", horiz = "█" }

-- suggestion by Avante.nvim plugin
vim.opt.laststatus = 3

-- Diff current buffer against the on-disk version (useful after external edits)
vim.api.nvim_create_user_command("DiffOrig", function()
  vim.cmd("vert new")
  vim.cmd("set buftype=nofile")
  vim.cmd("read ++edit #")
  vim.cmd("0d_")
  vim.cmd("diffthis")
  vim.cmd("wincmd p")
  vim.cmd("diffthis")
end, {})
