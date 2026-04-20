return {
    -- Git signs in the gutter (added, changed, removed lines)
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add          = { text = "▎" },
                change       = { text = "▎" },
                delete       = { text = "" },
                topdelete    = { text = "" },
                changedelete = { text = "▎" },
                untracked    = { text = "▎" },
            },
            signs_staged = {
                add          = { text = "▎" },
                change       = { text = "▎" },
                delete       = { text = "" },
                topdelete    = { text = "" },
                changedelete = { text = "▎" },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- Navigation
                map("n", "]h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gs.nav_hunk("next")
                    end
                end, "Next hunk")

                map("n", "[h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gs.nav_hunk("prev")
                    end
                end, "Prev hunk")

                map("n", "]H", function() gs.nav_hunk("last") end, "Last hunk")
                map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")

                -- Actions
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>",   "Stage hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>",   "Reset hunk")
                map("n", "<leader>ghS", gs.stage_buffer,                        "Stage buffer")
                map("n", "<leader>ghR", gs.reset_buffer,                        "Reset buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk,                     "Undo stage hunk")
                map("n", "<leader>ghp", gs.preview_hunk_inline,                 "Preview hunk inline")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
                map("n", "<leader>ghd", gs.diffthis,                            "Diff this")
                map("n", "<leader>ghD", function() gs.diffthis("~") end,        "Diff this ~")

                -- Toggles
                map("n", "<leader>uG", gs.toggle_signs,                         "Toggle git signs")
                map("n", "<leader>ub", gs.toggle_current_line_blame,            "Toggle line blame")

                -- Text objects
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
            end,
        },
    },

    -- Full Git integration (blame, log, diff, branches, etc.)
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit",
        },
        keys = {
            {
                "<leader>gg",
                function()
                    vim.cmd("vertical leftabove Git")
                    vim.cmd("vertical resize 40")
                end,
                desc = "Git status (left)",
            },
            {
                "<leader>gb",
                function()
                    local start_line, end_line
                    local mode = vim.fn.mode()
                    if mode == "V" or mode == "v" or mode == "\22" then
                        start_line = vim.fn.line("v")
                        end_line = vim.fn.line(".")
                        if start_line > end_line then
                            start_line, end_line = end_line, start_line
                        end
                    else
                        start_line = vim.fn.line(".")
                        end_line = start_line
                    end
                    vim.cmd("belowright Git blame -L " .. start_line .. "," .. end_line)
                    --vim.cmd("wincmd H")
                    vim.cmd("horizontal resize 10")
                end,
                mode = { "n", "v" },
                desc = "Git blame selected lines (bottom)",
            },
            --{ "<leader>gb",  "<cmd>Git blame<cr>",            desc = "Git blame (full)" },
            { "<leader>gG",  "<cmd>Git log --oneline<cr>",    desc = "Git log" },
            { "<leader>gdd", "<cmd>Gdiffsplit<cr>",           desc = "Diff split" },
            { "<leader>gdv", "<cmd>Gvdiffsplit<cr>",          desc = "Diff vsplit" },
            { "<leader>gB",  "<cmd>GBrowse<cr>",              desc = "Browse on remote" },
            { "<leader>gc",  "<cmd>Git commit<cr>",           desc = "Git commit" },
            { "<leader>gC",  "<cmd>Git commit --amend<cr>",   desc = "Git commit amend" },
            { "<leader>gp",  "<cmd>Git push<cr>",             desc = "Git push" },
            { "<leader>gP",  "<cmd>Git pull<cr>",             desc = "Git pull" },
            { "<leader>gf",  "<cmd>Git fetch<cr>",            desc = "Git fetch" },
        },
    },
}
