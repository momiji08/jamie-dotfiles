local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	diagnostic = {
		show_code_action = true,
		show_source = true,
		show_layout = "float",
		extend_relatedInformation = true,
	},
	scroll_preview = {
		scroll_down = "<C-k>",
		scroll_up = "<C-j>",
	},
	definition = {
		edit = "<CR>",
	},
    ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    },
    code_action = {
        num_shortcut = true,
    }
})
