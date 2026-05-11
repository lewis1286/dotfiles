-- ~/.config/nvim/init.lua

-- ============================================================
-- CORE OPTIONS (your .vimrc settings, translated)
-- ============================================================
vim.g.mapleader = ","

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Visual
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.termguicolors = true

-- Modern additions
vim.opt.signcolumn = "yes"       -- always show gutter (no layout jumps)
vim.opt.cursorline = true        -- highlight current line
vim.opt.scrolloff = 8            -- keep 8 lines visible above/below cursor
vim.opt.wrap = false             -- no line wrapping (toggle per filetype below)
vim.opt.splitright = true        -- vertical splits open on the right
vim.opt.splitbelow = true        -- horizontal splits open below
vim.opt.updatetime = 250         -- faster diagnostics / hover
vim.opt.undofile = true          -- persistent undo across sessions

-- Folding

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false    -- don't fold everything on open
vim.opt.foldlevel = 99        -- only fold when you ask

-- ============================================================
-- KEYMAPS
-- ============================================================
local map = vim.keymap.set

-- Your muscle memory
map("i", "jj", "<Esc>", { desc = "Escape insert mode" })

-- Clear search highlight
map("n", "<leader>/", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Quick file explorer (built-in netrw, no NERDTree needed)
map("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })

-- ============================================================
-- FILETYPE SETTINGS
-- ============================================================
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true    -- wrap at word boundaries
        vim.opt_local.spell = true        -- spell check on
        vim.opt_local.spelllang = "en_us"
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.foldmethod = "indent"
        vim.opt_local.foldenable = true
    end,
})

-- ============================================================
-- PLUGINS (lazy.nvim — bootstraps itself, no separate install)
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({ style = "night" }) -- night, storm, moon, day
            vim.cmd("colorscheme tokyonight")
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", lazy = true },
    { "folke/tokyonight.nvim", lazy = true },
    { "rebelot/kanagawa.nvim", lazy = true },
    { "rose-pine/neovim", name = "rose-pine", lazy = true },
    { "sainnhe/everforest", lazy = true },

    -- Fuzzy finder — replaces a lot of what NERDTree + CtrlP did
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
        },
        config = true,
    },

    -- Treesitter — much better syntax highlighting, including markdown
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.treesitter.language.register("markdown", "markdown")
            require("nvim-treesitter").setup()
        end,
        opts = {
            ensure_installed = { "markdown", "markdown_inline", "lua", "bash", "json", "yaml" },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    -- Markdown preview in the browser
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },
        },
    },

    -- Better markdown editing (conceals syntax, pretty lists, etc.)
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = { "markdown" },
        opts = {},
    },

    -- Auto-close brackets/quotes
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Git signs in the gutter
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },

    -- Better statusline
    {
        "nvim-lualine/lualine.nvim",
        opts = { options = { theme = "gruvbox" } },
    },

})
