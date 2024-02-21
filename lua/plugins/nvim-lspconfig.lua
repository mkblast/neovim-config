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
            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({ 'n', 'x' }, 'gC', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

            vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
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
        local cmp_action = require('lsp-zero').cmp_action()
        local luasnip = require("luasnip")

        vim.api.nvim_create_autocmd('CursorMovedI', {
            pattern = '*',
            callback = function(ev)
                if not luasnip.session
                    or not luasnip.session.current_nodes[ev.buf]
                    or luasnip.session.jump_active
                then
                    return
                end

                local current_node = luasnip.session.current_nodes[ev.buf]
                local current_start, current_end = current_node:get_buf_position()
                current_start[1] = current_start[1] + 1 -- (1, 0) indexed
                current_end[1] = current_end[1] + 1     -- (1, 0) indexed
                local cursor = vim.api.nvim_win_get_cursor(0)

                if cursor[1] < current_start[1]
                    or cursor[1] > current_end[1]
                    or cursor[2] < current_start[2]
                    or cursor[2] > current_end[2]
                then
                    luasnip.unlink_current()
                end
            end
        })

        cmp.setup({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'buffer',  keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
                { name = "neorg" },
            },

            mapping = {
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-n>'] = cmp_action.luasnip_jump_forward(),
                ['<C-p>'] = cmp_action.luasnip_jump_backward(),

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
