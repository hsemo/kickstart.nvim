# Neovim Config

A minimal, readable Neovim setup. Every file has one job — you should always know where to look and what is mapped.

## Structure

```
init.lua                 # Bootstrap lazy.nvim, load plugins + core

lua/
├── core/                # Editor behaviour (no plugins)
│   ├── init.lua         # Loads options → keymaps → autocmds
│   ├── options.lua      # vim.opt defaults
│   ├── diagnostics.lua  # Diagnostic display + hover float
│   ├── autocmds.lua     # Autocommands (yank highlight, LspAttach hook)
│   ├── treesitter.lua   # Highlight + indent autocmds
│   └── neovide.lua      # GUI-only settings
│
├── keymaps/             # All keyboard shortcuts
│   ├── init.lua         # Loader
│   ├── general.lua      # Windows, buffers, clipboard, movement
│   └── lsp.lua          # Buffer-local LSP maps (via LspAttach)
│
├── plugins/             # One file per plugin (lazy.nvim specs)
│   ├── init.lua
│   ├── colorscheme.lua
│   ├── treesitter.lua
│   ├── lsp.lua
│   ├── typescript-tools.lua
│   ├── completion.lua
│   ├── format.lua
│   ├── snacks.lua
│   ├── which-key.lua
│   ├── lualine.lua
│   ├── barbecue.lua
│   ├── kulala.lua
│   ├── persistence.lua
│   ├── trouble.lua
│   └── autopairs.lua
│
├── lsp/                 # LSP config separate from plugin wiring
│   ├── capabilities.lua # Shared client capabilities (blink.cmp)
│   └── servers/         # Per-language server overrides
│       ├── lua_ls.lua
│       ├── typescript_tools.lua  # JS, TS, JSX, TSX
│       └── pyright.lua
│
└── snippets/            # Custom snippet definitions (optional)
    └── init.lua
```

### Why this layout?

| Directory | Responsibility |
|-----------|----------------|
| `core/` | Pure Neovim settings — works without any plugin |
| `keymaps/` | Every shortcut in one place; split by domain as you grow |
| `plugins/` | *What* to install and lazy-loading rules only |
| `lsp/servers/` | *How* each language server behaves |
| `snippets/` | Snippet JSON / Lua, kept out of keymaps |

Add new concerns as sibling files (`keymaps/git.lua`, `plugins/gitsigns.lua`) instead of growing a single file.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme |
| [lualine](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [barbecue.nvim](https://github.com/utilyre/barbecue.nvim) | Winbar breadcrumbs (nested code context) |
| [persistence.nvim](https://github.com/folke/persistence.nvim) | Per-project session save/restore |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics, symbols, LSP references |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [mason](https://github.com/mason-org/mason.nvim) | Install LSP servers & formatters |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP wiring (Lua, Python) |
| [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | JS / TS / React LSP |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocompletion |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard, picker, lazygit, terminal |
| [which-key](https://github.com/folke/which-key.nvim) | Discover keymaps (`<leader>?`) |
| [kulala.nvim](https://github.com/mistweaverco/kulala.nvim) | HTTP/REST client (`.http` files) |

## Language support

| Language | LSP | Formatter |
|----------|-----|-----------|
| Lua | lua-language-server | stylua |
| JavaScript / TypeScript / React | [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | prettierd |
| Python | pyright | isort + black |

Mason auto-installs formatters and Lua/Python servers on first launch.

**TypeScript note:** `typescript-tools` uses your project's `node_modules/typescript` (standard in any TS repo). If you open a standalone `.ts` file outside a project, install TypeScript globally: `npm install -g typescript`.

### Why typescript-tools over ts_ls?

| Option | Best for | Trade-off |
|--------|----------|-----------|
| **typescript-tools** (current) | Large TS/JS codebases, better tsserver perf | Separate plugin; needs Neovim ≥ 0.11 |
| **ts_ls** | Simplest setup, official lspconfig default | Slower on big projects; extra proxy layer |
| **vtsls** | VS Code feature parity, Vue/monorepos | Heavier; wraps VS Code extension |
| **tsgo** | Maximum speed (experimental) | Incomplete code actions; still maturing |

See [TypeScript LSP alternatives](#typescript-lsp-alternatives) below for details.

## Keymaps

Press `<leader>?` for buffer-local maps or `<leader><leader>?` for all maps.

### General (`keymaps/general.lua`)

| Key | Action |
|-----|--------|
| `<C-s>` | Save file |
| `<C-h/j/k/l>` | Move between windows |
| `<C-S-h/j/k/l>` | Resize windows |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<leader>bd` | Close buffer (Snacks) |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<leader>p` / `<leader>P` | Paste from system clipboard |
| `<M-j>` / `<M-k>` | Move line(s) down / up |
| `<leader>l` | Open Lazy plugin manager |
| `<leader>ul` | Toggle relative line numbers |

### Dashboard & sessions

| Key | Action |
|-----|--------|
| `<leader>h` | Open dashboard |
| `<leader>fp` | Project picker |
| `<leader>qs` | Restore session for cwd |
| `<leader>ql` | Restore last session |
| `<leader>qS` | Select session |
| `<leader>qd` | Stop saving sessions |

The startup dashboard lists **Projects** (git roots) and restores the matching session via persistence.nvim when you pick one.

### Find & search (`plugins/snacks.lua`)

| Key | Action |
|-----|--------|
| `<leader>e` | File explorer |
| `<leader>gg` | Lazygit (floating) |
| `<C-/>` / `<C-_>` | Floating terminal |
| `<leader><space>` | Smart find files |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>,` | Buffers (alternate) |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>/` | Search in current buffer |
| `<leader>sw` | Grep word or visual selection |
| `<leader>sd` | Diagnostics picker |
| `<leader>sk` | Keymaps picker |

### LSP (`keymaps/lsp.lua` — active when a server attaches)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` / `<leader>cr` | References (Trouble) |
| `gi` | Implementation |
| `gt` | Type definition |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cs` | Document symbols (Trouble) |
| `<leader>cS` | LSP panel (Trouble) |
| `<leader>co` | Organize imports (TS/JS only) |
| `<leader>cu` | Remove unused imports (TS/JS only) |
| `<leader>cf` | Fix all fixable issues (TS/JS only) |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>xd` | Diagnostic float |
| `<leader>xx` | Workspace diagnostics (Trouble) |
| `<leader>xX` | Buffer diagnostics (Trouble) |

Diagnostics also show as virtual text and in a **hover float** when the cursor rests on a warning/error.

### HTTP / REST (`plugins/kulala.lua` — in `.http` / `.rest` files)

| Key | Action |
|-----|--------|
| `<leader>Rs` | Send request under cursor |
| `<leader>Ra` | Send all requests in file |
| `<leader>Rb` | Open HTTP scratchpad |
| `<leader>Rr` | Replay last request |

Kulala also enables buffer-local keymaps automatically in `.http` files. See [kulala keymaps](https://neovim.getkulala.net/docs/getting-started/keymaps).

### Format (`plugins/format.lua`)

| Key | Action |
|-----|--------|
| `<leader>fm` | Format file or visual selection |

Format on save is enabled via conform.nvim.

## TypeScript LSP alternatives

Four realistic options for JS/TS/React in Neovim today:

### 1. typescript-tools.nvim (this config)

Talks to `tsserver` directly (same approach as VS Code), skipping the `typescript-language-server` proxy. Generally faster and more responsive in large monorepos. Includes extra `TSTools*` commands (organize imports, fix all, rename file).

- **Pros:** Performance, rich refactor actions, active community
- **Cons:** Requires Neovim 0.11+; must not run alongside `ts_ls`

### 2. ts_ls (typescript-language-server)

The default in nvim-lspconfig. A Node.js wrapper around tsserver speaking standard LSP.

- **Pros:** Zero extra plugins; Mason one-liner
- **Cons:** Noticeably slower on large codebases; less control over tsserver features

### 3. vtsls

Wraps the VS Code TypeScript extension. LazyVim's default before `tsgo`.

- **Pros:** Closest to VS Code behaviour; excellent monorepo + Vue support via plugins
- **Cons:** Heavier install; author notes it may be less robust than alternatives

### 4. tsgo (typescript-go)

Microsoft's experimental Go port of tsserver (`@typescript/native-preview`). LazyVim is adding support.

- **Pros:** Fastest feedback loop in benchmarks
- **Cons:** Experimental — missing some code actions and edge-case features

**Recommendation:** Stick with **typescript-tools** for daily TS/React work. Consider **vtsls** if you need Vue or strict VS Code parity. Try **tsgo** when you want to experiment with speed and can tolerate gaps.

## Requirements

- Neovim ≥ 0.12
- `git`, `tar`, `curl` (Kulala HTTP client)
- [tree-sitter-cli](https://tree-sitter.github.io/tree-sitter/cli/) ≥ 0.26 (installed via Mason)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) — used by Snacks picker
- `npm` (for TypeScript in projects)
- `lazygit` on PATH (for `<leader>gg`)
- A [Nerd Font](https://www.nerdfonts.com/) (recommended)

## First run

```sh
nvim
:Lazy sync    " install plugins + run :TSUpdate
:Mason        " verify tree-sitter-cli and LSP tools
:TSInstall tsx typescript  " if parsers are missing
:checkhealth  " optional sanity check
```
