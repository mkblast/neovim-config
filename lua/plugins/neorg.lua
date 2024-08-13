return {
    "nvim-neorg/neorg",

    ft = "norg",

    cmd = "Neorg",

    dependencies = { "folke/zen-mode.nvim" },

    config = function()
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2

        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.summary"] = {},
                ["core.keybinds"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    }
                },
                ["core.dirman"] = {
                    config = {
                        default_workspace = "notes",
                        workspaces = {
                            notes = "~/Documents/notes",
                        },
                        index = "index.norg"
                    },
                },

                ["core.presenter"] = {
                    config = {
                        zen_mode = "zen-mode",
                    }
                },
            },
        })
    end,
}
