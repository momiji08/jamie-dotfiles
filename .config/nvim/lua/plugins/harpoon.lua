return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- IMPORTANT: harpoon2 is latest
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      local list = harpoon:list()

      -- Keymaps
      vim.keymap.set("n", "<leader>ha", function()
        list:add()
      end, { desc = "Harpoon add file" })

      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(list)
      end, { desc = "Harpoon quick menu" })

      -- Jump to files
      vim.keymap.set("n", "<leader>h1", function() list:select(1) end)
      vim.keymap.set("n", "<leader>h2", function() list:select(2) end)
      vim.keymap.set("n", "<leader>h3", function() list:select(3) end)
      vim.keymap.set("n", "<leader>h4", function() list:select(4) end)

      -- Clear
      vim.keymap.set("n", "<leader>hx", function() list:clear() end)

      -- Next / Prev
      local current_index = 1

      function _G.HarpoonNext()
        local total = list:length()
        if total == 0 then return end
        current_index = (current_index % total) + 1
        list:select(current_index)
      end

      function _G.HarpoonPrev()
        local total = list:length()
        if total == 0 then return end
        current_index = (current_index - 2 + total) % total + 1
        list:select(current_index)
      end

      vim.keymap.set("n", "<leader>hn", HarpoonNext)
      vim.keymap.set("n", "<leader>hp", HarpoonPrev)
    end,
  }
}
