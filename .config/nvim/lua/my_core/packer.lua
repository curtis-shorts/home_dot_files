vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer (package manager)
    use 'wbthomason/packer.nvim'
    -- Telescope (fuzzy finder for file/dir searches)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- File Browser Extension for Telescope
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    -- Catppuccin Theme Set
    use { "catppuccin/nvim", as = "catppuccin" }
    -- Rose Pine Theme
    use({
        'rose-pine/neovim', as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    -- Treesitter (parser for code in the active file
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- UndoTree
    use('mbbill/undotree')
    -- Fugitive
    use('tpope/vim-fugitive')
    -- LSP_STUFF
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        }
    }
    -- icons
    use 'nvim-tree/nvim-web-devicons'
    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
            }
        end
    }
    use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
