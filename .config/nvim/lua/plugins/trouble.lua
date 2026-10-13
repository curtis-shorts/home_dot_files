return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {"<leader>td", "<cmd>Trouble diagnostics toggle<cr>",                       desc = "Trouble: Show diagnostics"},
        {"<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",          desc = "Trouble: Show buffer diagnostics"},
        {"<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>",               desc = "Trouble: Show symbols"},
        {"<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",desc = "Trouble: Show LSP infromation"},
        {"<leader>tL", "<cmd>Trouble loclist toggle<cr>",                           desc = "Trouble: Show location list"},
        {"<leader>tq", "<cmd>Trouble qflist toggle<cr>",                            desc = "Trouble: Show quickfix list"},
    },
}

