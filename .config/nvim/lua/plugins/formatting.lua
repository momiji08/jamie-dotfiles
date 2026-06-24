return {
    "nvimtools/none-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                -- Use prettier for all frontend web assets
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
            },
            -- Enable format-on-save
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
        },
    }
}
