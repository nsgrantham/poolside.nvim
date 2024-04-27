# poolside.nvim

> A Virtual Vacation in Neovim.

## Installation

Install Poolside with your favorite Neovim package manager.

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "nsgrantham/poolside.nvim",
    requires = { "rktjmp/lush.nvim" },
}
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "nsgrantham/poolside.nvim",
    dependencies = { "rktjmp/lush.nvim" },
}
```

## Usage

Apply Poolside with `:colorscheme poolside`.

If Lualine does not update automatically, set `theme = "auto"` in the [Lualine options](https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration) and retry.
