return {
    -- Harpoon (captures files for quick navigation, best used for 2-3 files)
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon").setup()
            -- Add and list files
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,                          {desc="Harpoon: Add file"})
            vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,  {desc="Harpoon: List files"})
            -- Navigate harpoon list
            for i = 1, 9 do
                vim.keymap.set("n", "<leader>h" .. i, function() harpoon:list():select(i) end,              {desc="Harpoon: Jump to file " .. i})
            end
            vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,                         {desc="Harpoon: Jump to prev file"})
            vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,                         {desc="Harpoon: Jump to next file"})
        end,
    }
}
