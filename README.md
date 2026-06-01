# nvim config

A minimal, modern Neovim config built with [lazy.nvim](https://github.com/folke/lazy.nvim) and native APIs (Neovim ≥0.11).

## Features

- **Completion** — [blink.cmp](https://github.com/saghen/blink.cmp) with LSP, snippets, path, buffer sources
- **LSP** — native `vim.lsp.enable` (no lspconfig boilerplate), with `lua_ls`, `mason.nvim` for install, `nvim-lspconfig` for server configs
- **Fuzzy finding** — [Telescope](https://github.com/nvim-telescope/telescope.nvim) + fzf-native
- **File explorer** — [Oil](https://github.com/stevearc/oil.nvim) with git and LSP diagnostics integration
- **Statusline** — [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- **Git** — [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim), [Snacks](https://github.com/folke/snacks.nvim) lazygit + GH issues/PRs picker
- **Diagnostics UI** — [Trouble](https://github.com/folke/trouble.nvim), [fidget.nvim](https://github.com/j-hui/fidget.nvim)
- **Navigation** — [Flash](https://github.com/folke/flash.nvim) for quick jumps, [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) for smart folding
- **Keymaps** — [which-key.nvim](https://github.com/folke/which-key.nvim) with helix-style popups
- **AI** — [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) and [windsurf.vim](https://github.com/Exafunction/windsurf.vim)
- **Other** — nvim-autopairs, todo-comments, tree-sitter-manager, wakatime

## Requirements

- Neovim ≥0.11 (for `vim.lsp.enable`, `vim._core.ui2`)
- Nerd Font (for icons)
- `git` (for lazy.nvim bootstrap)

## Getting started

```sh
git clone https://github.com/davenchy/nvim ~/.config/nvim
nvim +Lazy sync
```

Everything is auto-bootstrapped — lazy.nvim installs itself on first run.

## Keymaps

| Key         | Action                          |
|-------------|---------------------------------|
| `<Space>`   | Leader                          |
| `<C-s>`     | Save                            |
| `<C-q>`     | Quit all                        |
| `<Esc>`     | Clear search highlight          |
| `<C-p>`     | Open Telescope                  |
| `<leader>ff`| Find files                      |
| `<leader>fg`| Live grep                       |
| `-`         | Oil file explorer               |
| `gd`        | Go to definition                |
| `s` / `S`   | Flash jump / treesitter jump    |
| `<C-a>`     | Ask opencode `@this`            |
| `<C-x>`     | Select opencode                 |
| `go` / `goo`| Opencode operator / line        |

See `lua/keymaps.lua` for the full list.

## Commands

- `:Format` — format buffer with LSP
- `:LspInfo` — show LSP health
- `:Home` — open dashboard
