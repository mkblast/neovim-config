return {
    "saghen/blink.cmp",

    lazy = false,

    version = 'v0.*',

    dependencies = {
        { "rafamadriz/friendly-snippets" },

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
            preset = "none",

            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide" },
            ["<C-o>"] = { "select_and_accept" },

            ["<C-j>"] = { "show", "select_next", "fallback" },
            ["<C-k>"] = { "show", "select_prev", "fallback" },

            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },

            ["<C-n>"] = { "snippet_forward" },
            ["<C-p>"] = { "snippet_backward" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono"
        },

        completion = {
            menu = {
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                update_delay_ms = 0,
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "lazydev", "buffer" },

            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },

        signature = { enabled = true }
    },

    opts_extend = { "sources.default" }
}
