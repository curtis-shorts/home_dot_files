return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        -- Navigate buffers with Left/Right arrows
        vim.keymap.set('n', "<leader><Left>", "<cmd>BufferLineCyclePrev<cr>",   {desc="Bufferline: Cycle one buffer left"})
        vim.keymap.set('n', "<leader><Right>", "<cmd>BufferLineCycleNext<cr>",  {desc="Bufferline: Cycle one buffer right"})
        -- Other commands
        vim.keymap.set('n', "<leader>bp", "<cmd>BufferLinePick<cr>",            {desc="Bufferline: Pick a buffer to jump to"})
        vim.keymap.set('n', "<leader>bc", "<cmd>BufferLinePickClose<cr>",       {desc="Bufferline: Pick a buffer to close"})
        vim.keymap.set('n', "<leader>bd", "<cmd>bd<cr>",                        {desc="Bufferline: Close the current buffer"})
        vim.keymap.set('n', "<leader>bs", "<cmd>BufferLineSortByDirectory<cr>", {desc="Bufferline: Sort buffers by directory"})
        -- Map <leader>1 through <leader>9 to go to the respective visible buffer
        for i = 1, 9 do
            vim.keymap.set('n', "<leader>" .. i, function()
                require("bufferline").go_to_buffer(i, true)
            end, { desc = "Bufferline: Jump to buffer " .. i })
        end
        require("bufferline").setup({
            options = {
                numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function
                close_command = function(bufnum)
                    vim.api.nvim_buf_delete(bufnum, { force = false })
                end,
                right_mouse_command = function(bufnum)
                    vim.api.nvim_buf_delete(bufnum, { force = false })
                end,
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                diagnostics_indicator = function(_, _, diag)
                    local icons = {
                        Error = " ",
                        Warn = " ",
                        Hint = " ",
                        Info = " "
                    }
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                    .. (diag.warning and icons.Warn .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
                separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
                modified_icon = "●",
                show_close_icon = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_tab_indicators = true,
                enforce_regular_tabs = false,
                sort_by = "id", -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
            },
            highlights = {
                buffer_selected = {
                    bold = true,
                    italic = false,
                },
            },
        })
    end,
}
