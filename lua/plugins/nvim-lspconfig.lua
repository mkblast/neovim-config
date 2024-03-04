return {
    'VonHeikemen/lsp-zero.nvim',

    branch = 'v3.x',

    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-path' },     -- Required
        { 'hrsh7th/cmp-buffer' },   -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'hrsh7th/cmp-cmdline' },  -- Required
        {                           -- Required
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        }
    },

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set('n', '<leader>ls', require('telescope.builtin').lsp_document_symbols, opts)
            vim.keymap.set('n', '<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
            vim.keymap.set('n', '<leader>ld', require('telescope.builtin').diagnostics, opts)

            vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
            vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
            vim.keymap.set('n', 'go', require('telescope.builtin').lsp_type_definitions, opts)
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
            vim.keymap.set({ 'n', 'x' }, 'gC', vim.lsp.buf.format, opts)

            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        end)

        -- custom config ex:
        -- require('lspconfig').lua_ls.setup({})

        lsp_zero.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'tsserver',
                'rust_analyzer',
                'clangd',
                'pylsp',
                'lua_ls',
                'html',
                'emmet_language_server',
                'cssls',
                'eslint',
            },

            handlers = {
                lsp_zero.default_setup,
            },
        })

        -- You need to setup `cmp` after lsp-zero
        local cmp = require('cmp')
        local luasnip = require 'luasnip'

        luasnip.config.setup {}

        cmp.setup({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'buffer',  keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
                { name = "neorg" },
            },

            mapping = cmp.mapping.preset.insert {
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-n>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-p>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),

                ['<C-j>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = 'insert' })
                    else
                        cmp.complete()
                    end
                end),
                ['<C-k>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = 'insert' })
                    else
                        cmp.complete()
                    end
                end),

                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            },

            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })
    end
}
