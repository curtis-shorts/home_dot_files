return {
    -- Harpoon (captures files for quick navigation, best used for 2-3 files)
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon").setup()

            -- Add and list files
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            -- Toggle through harpoon list
            vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
            -- Toggle next/last list item
            vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
        end,
    }
}
