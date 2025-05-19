-- Treesitter (parser for code in the active file)
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Ensure parsers stay up to date
        event = { "BufReadPost", "BufNewFile" }, -- Load when opening a file
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c", "lua", "vim", "python", "rust", "go", "fish", "bash", "cmake", "bibtex", "cpp", "cuda",
                    "dockerfile", "gitignore", "html", "java", "javascript", "typescript", "json", "json5", "latex",
                    "regex", "sql", "verilog", "yaml", "wgsl"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
        end,
    }
    -- NOTE: Treesitter playground depricated, use the build-in :InspectTree instead
    --      Mapped to "<leader>it" now
}

