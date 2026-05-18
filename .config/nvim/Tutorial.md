# Neovim Power User Tutorial

## Your Setup at a Glance

You're running **LazyVim** (the distribution, not just the plugin manager). This gives you:
- `telescope.nvim` — fuzzy finder for everything
- `neo-tree.nvim` — file explorer
- `flash.nvim` — supercharged motion
- `nvim-lspconfig` + `mason.nvim` — full LSP (TypeScript, C/C++, JSON, Markdown)
- `nvim-cmp` — autocomplete
- `gitsigns.nvim` + `lazygit` — git integration
- `which-key.nvim` — keymap discovery
- `mini.surround` — surround text objects
- `noice.nvim` — fancy command-line UI
- `trouble.nvim` — diagnostic list

**Your leader key is `,`** (comma). Most power-user shortcuts start with it.

> **Gotcha**: In vanilla vim, `,` repeats an `f`/`t` find backwards. With `,` as leader, there's a tiny delay before that works. Use `;` to repeat forward, `,` still works but with a short wait.

---

## Module 1: Discover What You Have — Which-key & Lazy

### Exercise 1.1: The which-key cheat sheet

In normal mode, press `,` and **wait half a second**. A popup appears showing every leader key binding. This is your in-editor cheat sheet. You never need to memorize all keymaps.

Key groups you'll see:
- `,f` — find/files (Telescope)
- `,g` — git
- `,c` — code (LSP actions)
- `,x` — diagnostics/trouble
- `,b` — buffers
- `,s` — search
- `,u` — UI toggles


### Exercise 1.2: The Lazy plugin manager UI

```
:Lazy
```

Press `U` to update all plugins, `l` to see load log, `q` to quit. Press `?` inside Lazy for help. This is how you manage everything.

### Exercise 1.3: Mason (LSP/tool installer)

```
:Mason
```

Shows all installed language servers and tools. Press `i` to install something, `X` to uninstall.

---

## Module 2: Navigation — Stop Using Arrow Keys

### Exercise 2.1: In-file motion upgrades

You know `h/j/k/l`. Level up:

| Key | Does |
|-----|------|
| `w` / `b` | Next/prev word start |
| `e` / `ge` | Next/prev word end |
| `0` / `^` / `$` | Line start (col 0) / first non-blank / end |
| `{` / `}` | Prev/next empty line (paragraph jump) |
| `gg` / `G` | Top / bottom of file |
| `50G` or `:50` | Jump to line 50 |
| `%` | Jump to matching bracket |
| `*` / `#` | Search forward/backward for word under cursor |

**Practice**: Open any file in `~/code`, navigate using only these.

### Exercise 2.2: `f`, `t`, and `;`

- `f<char>` — jump to next occurrence of `<char>` on the line
- `t<char>` — jump to just before it
- `F<char>` / `T<char>` — same, backwards
- `;` — repeat the last `f`/`t` forward
- `,` — repeat backwards (with your leader delay)

**Practice**: On a line with commas, use `f,` then `;` to hop through them.

### Exercise 2.3: Flash.nvim — the real game changer

LazyVim includes `flash.nvim`. In normal mode:

- Press `s` — type 2 chars of your target, labels appear, press the label key to teleport there
- Works across the whole visible screen
- Also works in operator-pending mode: `ys<flash motion>` to surround, `d<flash motion>` to delete

**Practice**: Open a long file. Press `s`, type `fn` (or any 2-char sequence from somewhere visible). Jump there instantly.

### Exercise 2.4: Jump list navigation

Every time you make a "big" jump (`gg`, `G`, `/search`, `gd`, etc.), nvim records it:

- `<C-o>` — jump back (older position)
- `<C-i>` — jump forward (newer position)

This is how you navigate after "go to definition" without getting lost.

---

## Module 3: Telescope — Fuzzy Find Everything

Telescope is your command center. All shortcuts start with `,f` or `,s`.

### Exercise 3.1: File finding

```
,ff    find files (project-wide)
,fr    recent files
,fg    files tracked by git
,fb    open buffers
```

Inside Telescope:
- Type to fuzzy filter
- `<C-j>` / `<C-k>` to move up/down
- `<CR>` to open, `<C-x>` to open in split, `<C-v>` for vertical split
- `<C-t>` to open in new tab
- `<Esc>` to close

**Practice**: `,ff` then type partial filename from `~/code`.

### Exercise 3.2: Live grep

```
,sg    live grep (ripgrep across all files)
,sG    grep in git files only
,sw    grep word under cursor
```

This replaces `:vimgrep`. Type a pattern, results update live. Jump to any match.

**Practice**: `,sg` then search for a function name you know exists in `~/code`.

### Exercise 3.3: Symbol search

```
,ss    document symbols (functions, classes, vars in current file)
,sS    workspace symbols (project-wide)
```

**Practice**: `,ss` in any Python or TypeScript file from `~/code` — see all functions listed, jump to any.

### Exercise 3.4: Everything else Telescope does

```
,s"    registers
,sk    keymaps (search all keymaps!)
,sh    help tags
,sm    marks (replaces your 'm' workflow with fuzzy search)
,sd    document diagnostics
```

`,sk` is especially useful when you forget a keymap but remember part of its description.

---

## Module 4: Buffers, Windows, and Tabs

### Exercise 4.1: Buffer navigation

In LazyVim, files you open are "buffers". The buffer bar shows at the top.

```
<S-h>       previous buffer (Shift+h)
<S-l>       next buffer (Shift+l)
,bd         delete (close) current buffer
,bD         delete buffer + window
,bb         switch to last buffer
,bp         pin buffer (won't close with ,bd)
```

**Practice**: Open 3 files with `,ff`, then navigate between them with `<S-h>`/`<S-l>`.

### Exercise 4.2: Window splits

```
<C-h/j/k/l>    navigate between splits (works with tmux too)
,w|             vertical split
,w-             horizontal split
,wd             close split
,ww             cycle splits
```

Or use the classic:
```
:sp filename    horizontal split
:vs filename    vertical split
```

**Practice**: Open a file, do `,w|` (pipe char), then `,ff` to open a different file in the new split. Navigate between them with `<C-h>` / `<C-l>`.

### Exercise 4.3: Resize splits
FIXME: Not actually True!!!

```
<C-Up/Down/Left/Right>    resize splits
```

---

## Module 5: File Explorer (Neo-tree)

```
,e     toggle Neo-tree sidebar
,E     focus Neo-tree
```

Inside Neo-tree:

| Key | Action |
|-----|--------|
| `<CR>` or `l` | open file/expand dir |
| `h` | collapse dir |
| `a` | create file/dir (end with `/` for dir) |
| `d` | delete |
| `r` | rename |
| `c` / `m` | copy / move |
| `y` | copy to clipboard |
| `p` | paste |
| `?` | help |
| `q` | close |
| `/` | filter |
| `H` | toggle hidden files |

**Practice**: Open neo-tree in `~/code`, create a test file, rename it, delete it.

---

## Module 6: LSP Superpowers

This is where nvim pulls ahead of most IDEs. LSP gives you language intelligence.

### Exercise 6.1: Navigation

With cursor on any function/variable:

```
gd     go to definition
gD     go to declaration
gr     go to references (opens Telescope)
gI     go to implementation
gy     go to type definition
K      hover documentation (press K again to enter the popup)
```

After `gd`, use `<C-o>` to jump back.

### Exercise 6.2: Code actions and refactoring

```
,ca    code action (fix imports, extract function, etc.)
,cr    rename symbol (renames across all files)
,cf    format file
,cF    format range (visual mode)
```

**Practice**: In a TypeScript file, hover over a type with `K`, then go to its definition with `gd`.

### Exercise 6.3: Diagnostics

```
]d     next diagnostic
[d     prev diagnostic
,cd    show diagnostic (line detail)
,xx    open Trouble (full diagnostic list)
,xX    workspace diagnostics
,xL    location list
```

Inside Trouble, press `?` for help. You can jump to any error, filter by type.

---

## Module 7: Git Integration

### Exercise 7.1: Gitsigns — inline git

In any file with git changes, you'll see signs in the gutter (`+`, `~`, `_`).

```
]h     next hunk (changed section)
[h     prev hunk
,ghp   preview hunk (shows diff inline)
,ghs   stage hunk
,ghr   reset hunk
,ghb   blame line
,ghS   stage entire buffer
,ghR   reset entire buffer
```

**Practice**: Edit a file in `~/code`, save it, then use `]h` to find the changed hunk and `,ghp` to preview the diff.

### Exercise 7.2: Lazygit

```
,gg    open Lazygit (full TUI git client)
,gG    Lazygit for current file
```

Inside Lazygit:
- `s` — stage/unstage file
- `c` — commit
- `P` — push
- `p` — pull
- `b` — branch menu
- `?` — help
- `q` — quit

This replaces most `git` terminal commands.

---

## Module 8: Text Objects — The Vim Grammar

Vim commands follow a grammar: `[count] verb [text-object]`. You know verbs (`d`, `c`, `y`, `v`). Text objects define *what* to operate on.

### Exercise 8.1: Built-in text objects

```
iw / aw    inner word / a word (with space)
is / as    inner sentence / a sentence
ip / ap    inner paragraph / a paragraph
i" / a"    inside quotes / including quotes
i' / a'    same for single quotes
i` / a`    same for backticks
i( / a(    inside parens / including parens  (also i) )
i{ / a{    inside braces / including (also iB/aB)
i[ / a[    inside brackets
i< / a<    inside angle brackets
it / at    inside tag / including tag (HTML/XML)
```

**Examples**:
- `ci"` — change everything inside quotes (leaves cursor inside empty quotes)
- `da(` — delete argument including the parens
- `yi{` — yank inside braces
- `va{` — visually select including braces
- `=i{` — re-indent inside braces

**Practice**: On a function call like `foo("hello", 42)`, try `ci(` to change the arguments.

### Exercise 8.2: Treesitter text objects (LazyVim adds these)

Because you have treesitter, you get syntax-aware text objects:

```
]f / [f    next/prev function
]c / [c    next/prev class
]a / [a    next/prev argument
```

And in operator-pending mode:
```
vaf    select a function
vif    select inside function (body only)
vac    select a class
```

### Exercise 8.3: Mini.surround

LazyVim includes `mini.surround`. The operator is `gs`:

```
gsa"    surround selection with "
gsd"    delete surrounding "
gsr"'   replace surrounding " with '
```

In normal mode:
- `gsaiw"` — surround word with quotes
- `gsd(` — delete surrounding parens
- `gsr"'` — replace `"` with `'`

**Practice**: Put cursor on a word, press `gsaiw"` to wrap it in quotes. Then `gsd"` to remove them.

---

## Module 9: Advanced Macros & Repetition

You know `q`. Here's what builds on it.

### Exercise 9.1: The dot command — your most powerful key

`.` repeats the last change. This is often better than a macro.

**Example workflow**:
1. You want to add a semicolon to end of several lines
2. Go to first line, press `A;` (append semicolon), `<Esc>`
3. Move to next line, press `.`
4. Repeat

**Practice**: Take 5 lines in `~/code`, add a comment `// TODO` to each using just `.` repetition.

### Exercise 9.2: Macros with specific registers

```
qq     record into register q
q      stop recording
@q     play macro q
@@     replay last macro
5@q    play macro q 5 times
```

Store macros in letters `a-z`. Use `a` for one task, `b` for another.

**Advanced**: Apply macro to visual selection:
1. Record macro into `q`
2. Visually select lines with `V`
3. `:norm @q` — applies the macro to each selected line

### Exercise 9.3: `@:` — replay last command

After any `:` command (`:s/foo/bar`, `:sort`, etc.), press `@:` to run it again. Combine with a count: `5@:`.

---

## Module 10: Search & Replace Power

### Exercise 10.1: Better in-file search

```
/pattern      search forward
?pattern      search backward
n / N         next/prev match
*             search word under cursor forward
#             search word under cursor backward
```

With `noice.nvim` (in your config), the search box appears in a floating popup.

**Tip**: `:set hlsearch` highlights all matches (on by default in LazyVim). Clear highlights with `,ur` (toggle) or just press `/` and `<Esc>`.

### Exercise 10.2: Substitution patterns

```
:s/old/new/         replace first on current line
:s/old/new/g        replace all on current line
:%s/old/new/g       replace all in file
:%s/old/new/gc      replace all, confirm each
:'<,'>s/old/new/g   replace in visual selection
```

Use `\v` for "very magic" (more regex-like):
```
:%s/\v(foo|bar)/baz/g    replace foo or bar with baz
```

### Exercise 10.3: Spectre — project-wide find & replace

```
,sr    open Spectre (search & replace across project)
```

In Spectre: type search pattern, type replacement, toggle which files to include, press `<leader>R` to replace all.

---

## Module 11: Managing Lazy Plugins

### Exercise 11.1: Adding a plugin

Create a new file in `~/.config/nvim/lua/plugins/myplugins.lua`:

```lua
return {
  {
    "plugin/name",
    event = "VeryLazy",  -- load lazily
    opts = {
      -- plugin options
    },
    keys = {
      { ",X", "<cmd>PluginCmd<cr>", desc = "Do thing" },
    },
  },
}
```

Run `:Lazy` then `I` to install. LazyVim merges your spec with its own — you never fight the base config.

### Exercise 11.2: Overriding LazyVim defaults

To change a plugin LazyVim already configures, just reference it by name:

```lua
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
      },
    },
  },
}
```

Your `opts` deep-merges with LazyVim's defaults. To disable a plugin entirely:

```lua
{ "plugin/name", enabled = false }
```

### Exercise 11.3: Adding keymaps to your config

Edit `~/.config/nvim/lua/config/keymaps.lua` (you already have `jj` → `<Esc>` there):

```lua
-- Quick save
vim.keymap.set("n", ",w", "<cmd>w<cr>", { desc = "Save file" })

-- Quick quit
vim.keymap.set("n", ",q", "<cmd>q<cr>", { desc = "Quit" })
```

---

## Quick Reference Card

### Most Impactful Keymaps to Learn First

| Priority | Key | Action |
|----------|-----|--------|
| 1 | `,ff` | Find file |
| 1 | `,sg` | Search in project |
| 1 | `gd` | Go to definition |
| 1 | `<C-o>` | Jump back |
| 2 | `s` + 2 chars | Flash jump anywhere |
| 2 | `gr` | Find references |
| 2 | `,ca` | Code action |
| 2 | `]d` / `[d` | Navigate diagnostics |
| 3 | `,gg` | Lazygit |
| 3 | `]h` / `[h` | Navigate git hunks |
| 3 | `,xx` | Trouble diagnostics |
| 3 | `ci"` etc | Change in quotes |

### Suggested Learning Order

1. **Week 1**: `,ff`, `,sg`, `gd`/`gr`/`K`, `<C-o>`, `<S-h>`/`<S-l>` — these alone will 2x your speed
2. **Week 2**: Flash (`s`), text objects (`ci"`, `da(`), `.` repeat
3. **Week 3**: Git workflow (gitsigns + Lazygit), Trouble diagnostics
4. **Week 4**: Macros beyond basics, surround, Spectre for project-wide changes

---

The single biggest unlock is `,ff` + `gd` + `<C-o>` — fuzzy-open any file, jump into definitions, jump back. Once that loop is muscle memory, every other feature compounds on top of it.
