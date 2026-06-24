local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

--Column
opt.colorcolumn = "80"

opt.scrolloff = 8

--Undo
opt.undofile = true

--conceal
opt.conceallevel = 2

-- Automatically set 2-space indentation for frontend/web files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "html" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})
