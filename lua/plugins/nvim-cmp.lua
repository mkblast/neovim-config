return {
    'hrsh7th/nvim-cmp',

    event = "InsertEnter",

    dependencies = {
        { 'hrsh7th/cmp-path' },

        { 'hrsh7th/cmp-buffer' },

        { 'hrsh7th/cmp-nvim-lsp' },

        { 'hrsh7th/cmp-cmdline' },

        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        },

        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            opts = {},
        },

        {
            'windwp/nvim-ts-autotag',
            opts = {
                autotag = {
                    enable = true,
                }
            }
        }
    },

    config = function()
        local cmp = require('cmp')
        local luasnip = require 'luasnip'

        luasnip.config.setup {}

        cmp.setup({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'buffer',  keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
                { name = "lazydev", group_index = 0 },
                { name = "neorg" },
            },

            mapping = cmp.mapping.preset.insert {
                -- `Enter` key to confirm completion
                ['<C-o>'] = cmp.mapping.confirm({ select = true }),
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

        require("nvim-autopairs").setup {
            map_c_w = true
        }

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}
