-- =========================================
-- LSP
-- =========================================

-- Setup keymaps when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end
        if client.server_capabilities.completionProvider then
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        local keymap = vim.keymap
        local opts = { noremap = true, silent = true, buffer = bufnr }

        keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        keymap.set("n", "gI", "<cmd>Lspsaga goto_definition<CR>", opts)
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
        keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
    end,
})

-- ========================
-- nvim-cmp capabilities
-- ========================
-- local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not cmp_status then return end
-- local capabilities = cmp_nvim_lsp.default_capabilities()

-- ========================
-- Diagnostics signs
-- ========================
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = "Error",
            [vim.diagnostic.severity.WARN] = "Warn",
            [vim.diagnostic.severity.INFO] = "Info",
            [vim.diagnostic.severity.HINT] = "Hint",

        },
    },
})

-- ========================
-- LSP servers
-- ========================

vim.lsp.config.htmlls = {}
-- vim.lsp.enable({ "ts_ls", "cssls", "tailwindcssls", "htmlls", "svelte" })

vim.lsp.config.cssls = {}

vim.lsp.config.tailwindcss = {}

vim.lsp.config.emmet_ls = {
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
}
vim.lsp.enable("emmet_ls")

vim.lsp.config.clangd = {
    filetypes = { "c", "cpp" },
    cmd = { "clangd" },
}
vim.lsp.enable("clangd")

vim.lsp.config.rust_analyzer = {
  checkOnSave = { command = "clippy" },
  filetypes = { "rust" },
  on_attach = function(client, bufnr)
    -- Format on save rustfmt required
    if client.supports_method("textDocument/formatting") then
      local group = vim.api.nvim_create_augroup("RustLspFormatOnSave", { clear = false })
      vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,}
vim.lsp.enable("rust_analyzer")

vim.lsp.config.lua_ls = {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" }
            },
            workspace = {
                -- library = vim.api.nvim_get_runtime_file("", true),
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
vim.lsp.enable("lua_ls")
-- -- Setup all servers using new API
-- for server, config in pairs(servers) do
--   local ok, srv = pcall(function()
--     return vim.lsp.configs[server]
--   end)
--
--   if ok and srv then
--     vim.lsp.configs[server]:setup(vim.tbl_extend("force", {
--       on_attach = on_attach,
--       capabilities = capabilities,
--     }, config))
--   end
-- end
