return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",

            opts = {},
        }
    },

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "jsdoc",
                "lua",
                "bash",
                "vim",
                "vimdoc",
                "query",
            },

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ss",
                    node_incremental = "<leader>si",
                    scope_incremental = "<leader>sc",
                    node_decremental = "<leader>sd",
                },
            },

        })
    end
}
