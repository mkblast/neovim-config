return {
    "saghen/blink.cmp",

    lazy = false,

    version = '1.*',

    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            opts = {
                autotag = {
                    enable = true,
                }
            }
        },

        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        },
    },

    opts = {

        keymap = {
            preset = "none",

            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide" },
            ["<C-o>"] = { "select_and_accept", "fallback" },

            ["<C-n>"] = { "show", "select_next", "fallback" },
            ["<C-p>"] = { "show", "select_prev", "fallback" },

            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },

            ["<C-j>"] = { "snippet_forward" },
            ["<C-k>"] = { "snippet_backward" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono"
        },

        cmdline = {
            completion = { menu = { auto_show = true } },
            keymap = {
                preset = "none",
                ["<C-space>"] = { "show", },
                ["<C-e>"] = { "hide" },
                ["<C-o>"] = { "select_and_accept" },

                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
            }
        },

        completion = {
            keyword = { range = "full" },
            menu = {
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind",              gap = 1 },
                    }
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500
            },
        },

        snippets = { preset = 'luasnip' },

        sources = {
            default = { "lsp", "buffer", "path", "snippets", "lazydev" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },

        signature = { enabled = true },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },

    opts_extend = { "sources.default" }
}
