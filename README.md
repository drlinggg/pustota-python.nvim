# pustota-python.nvim

A super-light, minimalist Neovim colorscheme: a literally white background and
a tiny palette. Tuned for Python (Treesitter + pyright via coc.nvim), but the
standard highlight groups make it work everywhere.

Inspired by the [pustota](https://github.com/pustota-theme/pustota) VSCode theme
by Nikita Sobolev — this is an independent Neovim port with a custom light
palette, not a 1:1 copy.

## Palette

| Role                                   | Color     |
| -------------------------------------- | --------- |
| Background                             | `#ffffff` |
| Text / variables / operators / builtins| `#24292e` |
| Comments / punctuation / line numbers  | `#8b94a0` |
| Strings                                | `#c0392b` |
| Numbers / `None` / `True` / `False`    | `#c15a86` |
| Keywords / decorators                  | `#1f6fd4` |
| Function / class / type names          | `#2f90c8` |

## Install

**vim-plug:**

```vim
Plug 'drlinggg/pustota-python.nvim'

colorscheme pustota
```

Then run `:PlugInstall`.

**lazy.nvim:**

```lua
{ "drlinggg/pustota-python.nvim", lazy = false, priority = 1000,
  config = function() vim.cmd.colorscheme("pustota") end }
```

**packer.nvim:**

```lua
use "drlinggg/pustota-python.nvim"
```

## Requirements

- A true-color terminal (`set termguicolors`).
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): the
  theme highlights through Treesitter capture groups and auto-installs parsers
  / enables highlighting when it is present. Install it with your plugin
  manager:

  ```vim
  Plug 'nvim-treesitter/nvim-treesitter'
  ```
