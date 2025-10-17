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
}
