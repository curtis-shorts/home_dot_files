return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        -- Navigate buffers with Left/Right arrows
        vim.keymap.set('n', "<leader><Left>", "<cmd>BufferLineCyclePrev<cr>")
        vim.keymap.set('n', "<leader><Right>", "<cmd>BufferLineCycleNext<cr>")
        -- Other commands
        vim.keymap.set('n', "<leader>bp", "<cmd>BufferLinePick<cr>")
        vim.keymap.set('n', "<leader>bc", "<cmd>BufferLinePickClose<cr>")
        vim.keymap.set('n', "<leader>bs", "<cmd>BufferLineSortByDirectory<cr>")
        require("bufferline").setup({
            options = {
                numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function
                close_command = function(bufnum)
                    -- You can use a custom function to delete buffers
                    -- If you have a plugin like "bufdelete.nvim", you could use:
                    -- require("bufdelete").bufdelete(bufnum, true)
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
