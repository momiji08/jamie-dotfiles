local setup, neorg = pcall(require, "neorg")
if not setup then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {
			config = {
				icon_preset = "diamond",
				folds = true,
			},
		}, -- Adds pretty icons to your documents
		["core.completion"] = { -- Completion engine
			config = {
				engine = "nvim-cmp",
				name = "[Norg]",
			},
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
					uni = "~/notes/uni",
					books = "~/notes/books",
					projects = "~/notes/projects",
					research = "~/notes/research",
					personal = "~/notes/personal",
					work = "~/notes/work",
				},
			},
		},
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				neorg_leader = "<Leader><Leader>",
			},
		},
		["core.export"] = {},
		["core.summary"] = {},
	},
})
