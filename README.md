# Dotfiles

Managed with a **bare git repository** — no symlinks, no extra tools, just git.

## How it works

A normal git repo has two parts:

- `.git/` — the git database (objects, refs, config)
- A **working tree** — where your actual files live, checked out next to `.git/`

This approach separates them: the git database lives at `~/dotfiles/` (a *bare* repo, meaning it contains only the database with no checked-out files), and the **working tree is set to `$HOME`**.

The `dotfiles` alias is just `git` with two flags hardcoded:

```zsh
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

- `--git-dir=$HOME/dotfiles/` — find the git database here
- `--work-tree=$HOME` — treat `$HOME` as the root of the working tree

So `dotfiles add ~/.zshrc` means: "track `.zshrc`, relative to `$HOME`." When you clone on a new machine and run `dotfiles checkout`, git writes every tracked file back into `$HOME` at exactly the right path.

No symlinks. No stow. No extra tools. Just git.

## New machine setup

```bash
# 1. Clone the bare repo
git clone --bare git@github.com:lewis1286/dotfiles.git $HOME/dotfiles

# 2. Add the alias for this session
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# 3. Check out tracked files into $HOME
dotfiles checkout

# 4. Suppress untracked file noise (git won't nag about every file in $HOME)
dotfiles config status.showUntrackedFiles no
```

After step 3, `~/.zshrc` is in place and the alias persists automatically.

> **If `dotfiles checkout` fails** because existing files would be overwritten, move the conflicts out of the way first, then checkout:
> ```bash
> mv ~/.zshrc ~/.zshrc.backup
> mv ~/.config/nvim ~/.config/nvim.backup
> dotfiles checkout
> ```
> Check the backed-up files against the new ones before deleting them.

## Daily usage

```bash
dotfiles status                        # see what's changed
dotfiles add ~/.zshrc                  # stage a file
dotfiles commit -m "update zshrc"     # commit
dotfiles push                          # push to GitHub
dotfiles ls-files                      # list all tracked files
dotfiles diff                          # see unstaged changes
```

## Tracking a new file

```bash
dotfiles add ~/.config/some-tool/config
dotfiles commit -m "track some-tool config"
dotfiles push
```

## Tracked files

- `~/.zshrc` — shell config (includes the `dotfiles` alias)
- `~/.p10k.zsh` — Powerlevel10k prompt config
- `~/.config/nvim/` — Neovim config
- `~/README.md` — this file
