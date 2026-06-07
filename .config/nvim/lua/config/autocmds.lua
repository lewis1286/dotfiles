-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-reload buffers when their file changes on disk.
-- LazyVim already runs :checktime on FocusGained/TermClose/TermLeave, but that
-- misses the common case where an external process (e.g. avante's claude-code
-- ACP agent, which writes files with its own tools) edits a file while you stay
-- inside Neovim — no focus change fires, so the buffer goes stale until reopened.
-- CursorHold/CursorHoldI fire when you pause, triggering a check; with autoread
-- on (the default), unmodified buffers then reload automatically.
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("checktime_external", { clear = true }),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

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
