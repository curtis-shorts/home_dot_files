return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install {
                'c','lua','vim','python','rust','go',
                'fish','bash','cmake','bibtex','cpp','cuda',
                'dockerfile','gitignore','html','java',
                'javascript','typescript','json','json5',
                'latex','regex','sql','yaml','wgsl'
            } -- 'verilog' unsupported
        end,
    }
}
