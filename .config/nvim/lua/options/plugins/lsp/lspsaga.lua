local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = {
		scroll_down = "<C-k>",
		scroll_up = "<C-j>",
	},
	definition = {
		edit = "<CR>",
	},
})
