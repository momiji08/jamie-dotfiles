vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "jj", "<ESC>")
keymap.set("n", "<ESC>", ":noh<CR>")
-- keymap.set("n", "x", '"_x') -- x doesn't enter register after deleting

keymap.set("n", "<leader>+", "<C-a>") -- increments
keymap.set("n", "<leader>-", "<C-x>") -- decrements

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

keymap.set("n", "<leader>pv", ":Ex<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>") -- find files within git repo

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Leetcode
keymap.set("n", "<leader>lm", ":Leet menu<CR>") -- opens menu
keymap.set("n", "<leader>lc", ":Leet console<CR>") -- opens console for curr question
keymap.set("n", "<leader>li", ":Leet info<CR>") -- info about curr question
keymap.set("n", "<leader>lt", ":Leet tabs<CR>") -- picker with curr questions
keymap.set("n", "<leader>ll", ":Leet lang<CR>") -- picker to change lang
keymap.set("n", "<leader>lr", ":Leet run<CR>") -- run curr question
-- keymap.set("n", "<leader>lt", ":Leet test<CR>") -- test curr question, same as run
keymap.set("n", "<leader>ls", ":Leet submit<CR>") -- submit curr question
keymap.set("n", "<leader>ld", ":Leet desc<CR>") -- toggle question description
keymap.set("n", "<leader>lp", ":Leet list<CR>") -- opens problemlist picker
keymap.set("n", "<leader>l@", ":Leet daily<CR>") -- opens question of the day
keymap.set("n", "<leader>l#", ":Leet random<CR>") -- opens random question
