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
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
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
