# Neovim Config

LazyVim distribution on top of Neovim. Tracked as part of a bare-git dotfiles repo (see `~/README.md`).

## Key facts

- **Distro**: [LazyVim](https://lazyvim.org) — opinionated defaults + extras system
- **Plugin manager**: lazy.nvim (bootstrapped in `lua/config/lazy.lua`)
- **Colorscheme**: Catppuccin Frappe
- **Dotfile tracking**: `dotfiles` alias (`git --git-dir=$HOME/dotfiles/ --work-tree=$HOME`) — no symlinks

## Directory structure

```
~/.config/nvim/
├── init.lua                  # entry point, just bootstraps lua/config/
├── lazyvim.json              # enabled LazyExtras (edit via :LazyExtras in Neovim)
├── lazy-lock.json            # lockfile — commit this to pin plugin versions
└── lua/
    ├── config/
    │   ├── lazy.lua          # lazy.nvim setup; imports lazyvim.plugins + lua/plugins/
    │   ├── options.lua       # vim options
    │   ├── keymaps.lua       # custom keymaps
    │   └── autocmds.lua      # autocommands
    └── plugins/              # custom plugin specs — every .lua file here is auto-loaded
        ├── colorscheme.lua
        ├── csvview.lua
        ├── disabled.lua      # currently empty; place `{ "plugin", enabled = false }` here
        ├── markdown.lua
        ├── obsidian.lua
        ├── snacks.lua
        ├── surround.lua
        ├── todo.lua
        ├── url-open.lua
        └── example.lua       # disabled (guard at top: `if true then return {} end`)
```

## How to add a plugin

Drop a new `.lua` file in `lua/plugins/` returning a table. No registration needed — lazy.nvim picks it up automatically.

```lua
return {
  {
    "author/plugin-name.nvim",
    ft = { "lua" },   -- optional: lazy-load by filetype
    opts = {},        -- passed to plugin's setup() function
  },
}
```

LazyExtras (`:LazyExtras`) are for officially bundled extras. Anything not listed there is added as a custom spec.

## Installed custom plugins

| File | Plugin | Purpose |
|------|--------|---------|
| `colorscheme.lua` | catppuccin/nvim | Catppuccin Frappe theme |
| `csvview.lua` | hat0uma/csvview.nvim | Aligned CSV/TSV table view with Excel-like nav |
| `markdown.lua` | render-markdown.nvim + bullets.vim | In-editor markdown rendering; disables marksman LSP, markdownlint, markdown-preview |
| `obsidian.lua` | epwalsh/obsidian.nvim | Obsidian vault integration (caremaze, second-brain, obsidian-vault-template workspaces) |
| `snacks.lua` | folke/snacks.nvim | Terminal, dashboard (ASCII header, projects section), picker (hidden files in file/grep) |
| `surround.lua` | nvim-mini/mini.surround | Surround motions (gsa/gsd/gsf/gsr); custom `w` surrounding for `[[wikilinks]]` |
| `todo.lua` | folke/todo-comments.nvim | Highlight TODO/FIXME/etc in non-comment lines too |
| `url-open.lua` | sontungexpt/url-open | Open URL under cursor |

## LazyExtras enabled

From `lazyvim.json`: `lang.clangd`, `lang.json`, `lang.markdown`, `lang.toml`.
Also `lang.typescript` hardcoded in `lazy.lua` (not in lazyvim.json).

## LuaLS annotations

Plugin specs use `---@module` and `---@type` annotations so the LSP can autocomplete valid `opts` keys. These are comments only — ignored at runtime, read by the Lua Language Server.

```lua
---@module "csvview"
---@type CsvView.Options
opts = { ... }
```

## Dotfile workflow

```bash
dotfiles status                        # see what's changed
dotfiles add ~/.config/nvim/lua/plugins/newplugin.lua
dotfiles commit -m "nvim: add newplugin"
dotfiles push
```

After adding a new plugin file, stage and commit it so it syncs to other machines.
