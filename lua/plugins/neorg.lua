return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.summary"] = {},
                ["core.keybinds"] = {
                    config = {
                        neorg_leader = ",",
                    }
                },
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
                }
            },
        }
    end,
}
