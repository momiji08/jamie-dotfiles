return {
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("config.lsp.lspsaga")
        end
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
    },
    {
    "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp.lspconfig")
        end
    },
    {

        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim",
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        require("config.lsp.nvim-cmp")
    end,
  },
}
