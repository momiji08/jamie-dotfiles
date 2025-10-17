local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- local lualine_palenight = require("lualine.themes.palenight")

lualine.setup({
  options = {
    -- theme = lualine_palenight
    theme = "catppuccin"
  }
})
