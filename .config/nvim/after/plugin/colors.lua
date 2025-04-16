-- Require color options
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',
	disable_background = true,
	disable_float_background = true,
})
require("catppuccin").setup({
    --- @usage 'latte' | 'frappe' | 'macchiato' | 'mocha'
    flavour = "mocha",
    transparent_background = true,
    term_colors = true,
})
-- Function to set the colors
function SetColorOrFallback(color)
	color = color;
	vim.cmd.colorscheme(color);
end
-- Set the color as desired
-- SetColorOrFallback("rose-pine")
SetColorOrFallback("catppuccin-mocha")
