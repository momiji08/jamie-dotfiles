-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	print("Packer not found")
	return
end

-- Plugins list
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- packer can manage itself
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- UI improvements
	use({ "catppuccin/nvim", as = "catppuccin" }) -- colorscheme
	use("christoomey/vim-tmux-navigator") -- tumux & split window navigation
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- harpoon
	use({
		"theprimeagen/harpoon",
		branch = "harpoon2",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		-- branch = "main",
		-- opt = true,
		-- event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

    -- rust
    use('mrcjkb/rustaceanvim')
    -- debugging
    use('mfussenegger/nvim-dap')

	-- use("jose-elias-alvarez/typescript.nvim") -- potentially discontinued, use pmizio/typescript-tools

	-- autocompletion snippets
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- enhanced ui
	use("nvim-tree/nvim-tree.lua")
	use("saadparwaiz1/cmp_luasnip")
	use("lukas-reineke/indent-blankline.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim") -- enhanced statusline
	-- use("rcarriga/nvim-notify") -- notification window, requres 24bit colour
	use("MunifTanjim/nui.nvim") -- Component Library

	-- Text editing modification
	use("rafamadriz/friendly-snippets")
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("numToStr/Comment.nvim")
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- cscope
	-- use({ "dhananjaylatkar/cscope_maps.nvim", opts = {} })

	-- formatting and linting
	use("nvimtools/none-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- java development
	use("mfussenegger/nvim-jdtls")

    -- install without yarn or npm
-- use({
--     "iamcco/markdown-preview.nvim",
--     run = function() vim.fn["mkdp#util#install"]() end,
-- })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	-- mips arm development asm
	use("harenome/vim-mipssyntax")

	-- -- Neorg note-taking plugin
	-- use("nvim-neorg/neorg", {
	-- 	ft = "norg",
	-- 	after = {
	-- 		"nvim-treesitter",
	-- 		"telescope",
	-- 	},
	-- 	run = ":Neorg sync-parsers",
	-- 	cmd = "Neorg",
	-- }) -- tag = "*"

	-- -- Leetcode
	-- use("kawre/leetcode.nvim", {
	-- 	run = ":TSUpdate html",
	-- 	after = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim", -- required by telescope
	-- 		"MunifTanjim/nui.nvim",
	--
	-- 		-- optional
	-- 		"rcarriga/nvim-notify",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- })

	-- latex integration
	use("lervag/vimtex")

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- Packer cheat sheet

-- use {
--   'myusername/example',        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   bufread = boolean,           -- Manually specifying if a plugin needs BufRead after being loaded
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded. The code is ran even if
--                                -- the plugin is waiting for other conditions (ft, cond...) to be met.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
--   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--                                -- requiring a string which matches one of these patterns, the plugin will be loaded.
-- }
