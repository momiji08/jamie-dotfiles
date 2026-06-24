return {
    -- rust
    "mrcjkb/rustaceanvim",
    "mfussenegger/nvim-dap",
    -- java
    "mfussenegger/nvim-jdtls",
    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    -- mips asm
    "harenome/vim-mipssyntax",
    -- typescript/javascript/node
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        opts = {
            settings = {
                spawn_without_tools = false, -- change to true if you don't want it relying on global node tools
                expose_as_code_action = "all",
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = "all", -- nice visual inline type hints
                    includeInlayVariableTypeHints = true,
                },
            },
        },
    },
}
