local setup, notify = pcall(require, "notify")
if not setup then
	return
end

-- require("notify")("My super important message, lets make this really long so I can see what it looks like")

notify.setup({
	background_colour = "#000000",
	fps = 144,
	render = "compact",
	stages = "fade",
})

-- Default values:
-- {
--   background_colour = "NotifyBackground",
--   fps = 30,
--   icons = {
--     DEBUG = "",
--     ERROR = "",
--     INFO = "",
--     TRACE = "✎",
--     WARN = ""
--   },
--   level = 2,
--   minimum_width = 50,
--   render = "default",
--   stages = "fade_in_slide_out",
--   timeout = 5000,
--   top_down = true
-- }
--
-- render values: default, minimal, simple, compact, wrapped-compact
-- stages(animation) values: fade_in_slide_out, fade, slide, static
