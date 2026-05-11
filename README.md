# dotfiles

Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim) — plugins bootstrap automatically on first launch.

## Install

```bash
git clone https://github.com/lewisguignard/dotfiles.git
cp -r dotfiles/nvim ~/.config/nvim
nvim  # lazy.nvim installs plugins on first open
```

## What's included

- `nvim/init.lua` — full config: options, keymaps, and plugins via lazy.nvim
- `nvim/lazy-lock.json` — pinned plugin versions

## Key plugins

- **Telescope** — fuzzy find files, grep, buffers (`<leader>ff`, `<leader>fg`)
- **Treesitter** — syntax highlighting
- **render-markdown.nvim** + **markdown-preview.nvim** — markdown editing
- **gitsigns.nvim** — git gutter
- **lualine** — statusline
- **nvim-autopairs** — auto-close brackets

## Keymaps

| Key | Action |
|-----|--------|
| `jj` | Exit insert mode |
| `<leader>/` | Clear search highlight |
| `<leader>e` | File explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<C-h/j/k/l>` | Window navigation |
