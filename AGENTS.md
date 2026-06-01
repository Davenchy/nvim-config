# AGENTS.md — Neovim config

## Architecture

```
init.lua               entrypoint — bootstraps lazy.nvim, loads modules
lua/options.lua        global vim.opt options
lua/keymaps.lua        keymaps + WhichKey groups + LspAttach autocmd
lua/lsp.lua            LSP enablement via vim.lsp.enable (native API)
lua/commands.lua       user commands + autocmds
lua/plugins/init.lua   all plugin specs (lazy.nvim)
lua/plugins/completions.lua  blink.cmp config
lua/plugins/opencode.lua     opencode.nvim config
```

- `init.lua` loads modules sequentially with `pcall` — a single module failure does **not** block others.
- All plugin specs live under `lua/plugins/`; lazy.nvim imports the `plugins` directory.
- `lazy-lock.json` is the lockfile — commit it.

## Plugin manager

Uses **lazy.nvim** (`folke/lazy.nvim`). Adding a plugin:
1. Add a spec entry in `lua/plugins/init.lua` (or a separate file under `lua/plugins/` for complex configs).
2. Run `:Lazy` to sync.

## LSP

- **Does NOT use** per-server `lspconfig.setup{}`. Uses the native `vim.lsp.enable("lua_ls")` API (Neovim >=0.11).
- `vim.lsp.config("*", { capabilities = ... })` sets global capabilities; per-server overrides go in `vim.lsp.config`.
- Adding a new server: `vim.lsp.enable("server_name")` in `lua/lsp.lua`. No need for lspconfig calls.

## Keymaps & WhichKey

- All keymaps in `lua/keymaps.lua`.
- WhichKey groups declared via `wk.add({ { "<leader>f", group = "files" }, ... })`.
- LSP-attach keymaps set in the `LspAttach` autocmd inside `keymaps.lua`.

## Key quirks

- Uses experimental `require("vim._core.ui2").enable({})` in options.lua.
- `blink.cmp` uses `opts_extend = { "sources.default" }` — adding providers elsewhere extends the default list rather than replacing it.
- No explicit formatter/linter plugin (relies on LSP's `vim.lsp.buf.format`).
- `tree-sitter-manager.nvim` handles parser install/update (`auto_install = true`).
- `mason.nvim` has `firewall.enabled = true`.
- Telescope and Snacks picker both available; Snacks picker used for GH issues/PRs.

## User commands

| Command   | Action                |
|-----------|-----------------------|
| `:Format` | Format buffer (LSP)   |
| `:LspInfo`| `checkhealth vim.lsp` |
| `:Home`   | Open dashboard        |

## Notes

- Config is **not** a plugin or library — no tests, no CI. Edits are validated by restarting Neovim.
- No README generation or doc build step.
