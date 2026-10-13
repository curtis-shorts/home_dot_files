return {
    -- Telescope (fuzzy finder for file/dir searches)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files,   {desc = 'Telescope: Search file names'})
            vim.keymap.set('n', '<leader>fl', builtin.live_grep,    {desc = 'Telescope: Search file contents'})
            vim.keymap.set('n', '<leader>fg', builtin.git_files,    {desc = 'Telescope: Search git repo'})
            vim.keymap.set('n', '<leader>fm', builtin.keymaps,      {desc = 'Telescope: Search keymaps'})
        end,
    },
    -- File Browser Extension for Telescope
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            local telescope = require('telescope').load_extension('file_browser')
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', {desc = 'Telescope: Open file browser'})
        end,
    }

}

