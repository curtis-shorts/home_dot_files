-- Theme setup
return {
	-- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        config = function()
            require("rose-pine").setup({
                --- @usage 'main' | 'moon'
                dark_variant = 'moon',
                disable_background = true,
                disable_float_background = true,
            })
            -- vim.cmd("colorscheme rose-pine")
        end
    },
    -- Catppuccin
    {
        "catppuccin/nvim",
		name = "catppuccin",
        lazy = false,
        priority = 1000,
		config = function()
        	require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				term_colors = true,
			})
            vim.cmd("colorscheme catppuccin")
		end,
    },
}

