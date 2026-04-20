-- Treesitter (parser for code in the active file)
return {
    {
        "nvim-treesitter/nvim-treesitter",
        commit = "28d480e",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "c","lua","vim","python","rust","go","fish","bash","cmake","bibtex","cpp","cuda",
                "dockerfile","gitignore","html","java","javascript","typescript","json","json5",
                "latex","regex","sql","verilog","yaml","wgsl"
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
        },
        --config = function(_, opts)
        --    require("nvim-treesitter.configs").setup(opts)
        --end,
    }
    -- NOTE: Treesitter playground depricated, use the build-in :InspectTree instead
    --      Mapped to "<leader>it" now
}

