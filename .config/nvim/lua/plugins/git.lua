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
                end, "Git: Next hunk")
                map("n", "[h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gs.nav_hunk("prev")
                    end
                end, "Git: Prev hunk")
                map("n", "]H", function() gs.nav_hunk("last") end, "Git: Last hunk")
                map("n", "[H", function() gs.nav_hunk("first") end, "Git: First hunk")
                -- Actions
                map({"n","v"}, "<leader>ghs", ":Gitsigns stage_hunk<CR>",               "Git: Stage hunk")
                map({"n","v"}, "<leader>ghr", ":Gitsigns reset_hunk<CR>",               "Git: Reset hunk")
                map("n", "<leader>ghS", gs.stage_buffer,                                "Git: Stage buffer")
                map("n", "<leader>ghR", gs.reset_buffer,                                "Git: Reset buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk,                             "Git: Undo stage hunk")
                map("n", "<leader>ghp", gs.preview_hunk_inline,                         "Git: Preview hunk inline")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end,  "Git: Blame line")
                map("n", "<leader>ghd", gs.diffthis,                                    "Git: Diff this")
                map("n", "<leader>ghD", function() gs.diffthis("~") end,                "Git: Diff this ~")
                -- Toggles
                map("n", "<leader>ghuG", gs.toggle_signs,                               "Git: Toggle git signs")
                map("n", "<leader>ghub", gs.toggle_current_line_blame,                  "Git: Toggle line blame")
                -- Text objects
                map({ "o", "x" }, "ghih", ":<C-U>Gitsigns select_hunk<CR>",             "Git: Select hunk")
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
            {"<leader>gg", function()
                    vim.cmd("vertical leftabove Git")
                    vim.cmd("vertical resize 40")
                end, desc = "Fugitive: Git status (left)"},
            {"<leader>gb", function()
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
                end, mode = { "n", "v" }, desc = "Fugitive: Git blame selected lines (bottom)"},
            { "<leader>gG",  "<cmd>Git log --oneline<cr>",    desc = "Fugitive: Git log" },
            { "<leader>gdd", "<cmd>Gdiffsplit<cr>",           desc = "Fugitive: Diff split" },
            { "<leader>gdv", "<cmd>Gvdiffsplit<cr>",          desc = "Fugitive: Diff vsplit" },
            { "<leader>gB",  "<cmd>GBrowse<cr>",              desc = "Fugitive: Browse on remote" },
            { "<leader>gc",  "<cmd>Git commit<cr>",           desc = "Fugitive: Git commit" },
            { "<leader>gC",  "<cmd>Git commit --amend<cr>",   desc = "Fugitive: Git commit amend" },
            { "<leader>gp",  "<cmd>Git push<cr>",             desc = "Fugitive: Git push" },
            { "<leader>gP",  "<cmd>Git pull<cr>",             desc = "Fugitive: Git pull" },
            { "<leader>gf",  "<cmd>Git fetch<cr>",            desc = "Fugitive: Git fetch" },
        },
    },
}
