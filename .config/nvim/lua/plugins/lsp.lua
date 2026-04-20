-- Packages for LSP management and code completion
-- Based on code taken from LSP-Zero: https://lsp-zero.netlify.app/docs/guide/lazy-loading-with-lazy-nvim.html
return {
    -- Autopairs (automatically makes closed braces when opening)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    -- Mason (a package manager for LSPs, formatters, and linters)
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            local mason = require("mason").setup()
        end,
    },
    -- Cmp (handles code autocompletion)
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({
                    -- For not messing with the arrow keys
                    --['<Down>'] = cmp.mapping(function(fallback)
                    --    cmp.close()
                    --    fallback()
                    --end, { "i" }),
                    --['<Up>'] = cmp.mapping(function(fallback)
                    --    cmp.close()
                    --    fallback()
                    --end, { "i" }),
                    -- Space to select the current option, Enter to cancel
                    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Enter>'] = cmp.mapping.abort(),
                    -- up/down for previous/next option
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<Down>'] = cmp.mapping.select_next_item(),

                    --['<C-p>'] = cmp.mapping.select_prev_item(),
                    --['<C-n>'] = cmp.mapping.select_next_item(),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    },
    -- Mason LSP Config (a bridge between LSP Config and Mason)
    {
        'neovim/nvim-lspconfig',
        version = "0.1.7",
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim', version = "1.8.3" },
            { 'williamboman/mason-lspconfig.nvim', version = "1.24.0" },
        },
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }
                    -- Commands that act on the string actively under the cursor
                    -- Default cursors buffer actions typically implemented (varies by LSP):
                    --      https://lsp-zero.netlify.app/blog/lsp-config-overview.html
                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'sh', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                    -- Go to x
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                end,
            })
            require('mason-lspconfig').setup({
                ensure_installed = {
                    -- LSPs
                    'clangd',
                    'lua_ls',
                    'cmake',
                    'bashls',
                    --'texlab',
                    'ltex',
                    'jedi_language_server',
                },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end
    },
}
