-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 'T always jumps to today's Obsidian daily note.
-- If the note exists, briefly switch to it to set the mark (setpos on unvisited buffers
-- silently fails in Neovim). If it's a new day, the mark is set on first BufEnter
-- after :ObsidianToday creates it (obsidian.nvim is lazy so we can't call it here).
-- Note: this file is loaded on VeryLazy (after VimEnter), so we run directly, no autocmd.
vim.schedule(function()
  local path = vim.fn.expand("~/Obsidian/second-brain/daily/") .. os.date("%Y-%m-%d") .. ".md"

  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = path,
    once = true,
    callback = function()
      vim.cmd("normal! mT")
    end,
  })

  if vim.fn.filereadable(path) == 1 then
    vim.cmd("keepjumps keepalt silent split " .. vim.fn.fnameescape(path))
    vim.cmd("normal! mT")
    vim.cmd("silent close")
  end
end)
