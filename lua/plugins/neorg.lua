return {
    "nvim-neorg/neorg",

    ft = "norg",

    cmd = "Neorg",

    dependencies = {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                options = {
                    signcolumn = "no",      -- disable signcolumn
                    number = false,         -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false,     -- disable cursorline
                    cursorcolumn = false,   -- disable cursor column
                    foldcolumn = "0",       -- disable fold column
                    list = false,           -- disable whitespace characters
                },
            },
            plugins = {
                tmux = { enabled = true }, -- disables the tmux statusline
            }
        }
    },

    config = function()
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2

        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.summary"] = {},
                ["core.keybinds"] = {},
                -- ["core.completion"] = {
                --     config = {
                --         engine = "nvim-cmp",
                --     }
                -- },
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
