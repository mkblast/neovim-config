return {
    "saghen/blink.cmp",
    lazy = false,
    version = 'v0.*',

    dependencies = {
        { "rafamadriz/friendly-snippets" },

        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        },

        {
            "windwp/nvim-ts-autotag",
            opts = {
                autotag = {
                    enable = true,
                }
            }
        },

        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {},
        },
    },

    opts = {
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide" },
            ["<C-o>"] = { "select_and_accept" },

            ["<C-j>"] = { "show", "select_next", "fallback" },
            ["<C-k>"] = { "show", "select_prev", "fallback" },

            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },

            ["<C-n>"] = { "snippet_forward", "fallback" },
            ["<C-p>"] = { "snippet_backward", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono"
        },

        snippets = {
            expand = function(snippet) require("luasnip").lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require("luasnip").jumpable(filter.direction)
                end
                return require("luasnip").in_snippet()
            end,
            jump = function(direction) require("luasnip").jump(direction) end,
        },

        completion = {
            menu = {
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                update_delay_ms = 0,
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "luasnip", "buffer", "lazydev" },

            min_keyword_length = 3,

            providers = {
                lsp = { fallback_for = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
        },

        signature = { enabled = false }
    },

    opts_extend = { "sources.default" }
}
