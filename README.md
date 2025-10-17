# Dotfiles

Repo contains the dotfiles for my linux/mac setup

## Requirements

Check for the following:

### Git

To ensure version control

For arch:

```
sudo pacman -S git
```

For debian:

```
sudo apt install git
```

### Stow

Allows us to have linked dotfiles in a single directory.
Stow will create a link between the files in this repo and
files in your system. Ensure the structure remains the same,
i.e. HOME/.config/nvim = dotfiles/.config/nvim.

Simply use `stow .` in root of the dotfiles(this repo). If you have the
corresponding files it should create a symlink to this repo instead.
Ensure that any existing files are backed-up (i.e nvim.bak).

For arch:

```
sudo pacman -S stow
```

For debian:

```
sudo apt install stow
```

### Nvim plugins list:
- nvim-lua/plenary.nvim
- catppuccin/nvim
- nvim-teleschope/telescope.nvim
- nvim-treesitter/nvim-treesitter
- theprimeagen/harpoon

#### LSP:
- neovim/nvim-lspconfig
- williamboman/mason.nvim
- williamboman/mason-lspconfig.nvim
- nvimdev/lspsaga.nvim
- nvim-tree/nvim-web-devicons

#### Rust:
- mrcjkb/rustaceanvim
- mfussenegger/nvim-dap

#### Java:
- mfussenegger/nvim-jdtls

#### Mips:
- harenome/vim-mipssyntax

#### Latex:
- lervag/vimtex

#### Git:
- lewis6991/gitsigns.nvim

#### Autocompletion:
- hrsh7th/nvim-cmp
- hrsh7th/cmp-nvim-lsp
- hrsh7th/cmp-buffer
- hrsh7th/cmp-path
- L3MON4D3/LuaSnip

#### Enhanced ui:
- nvim-tree/nvim-tree.lua
- saadparwaiz1/cmp_luansip
- lukas-reineke/indent-blankline.nvim
- kyazdani42/nvim-web-devicons
- nvim-lualine/lualine.nvim
- MunifTanjim/nui.nvim

#### Text editing modification:
- rafamadriz/friendly-snippets
- tpope/vim-surround
- vim-scripts/ReplaceWithRegister
- numToStr/Comment.nvim
- onsails/lspkind.nvim
- windwp/nvim-autopairs

#### Formatting and linting:
- nvimtools/none-ls.nvim
- jayp0521/mason-null-ls.nvim
- iamcco/markdown-preview.nvim
