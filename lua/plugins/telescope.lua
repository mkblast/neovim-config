return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    keys = {
        { mode = "n",          "<leader>fp", require("telescope.builtin").find_files,  { noremap = true, silent = true } },
        { mode = "n",          "<leader>fh", require("telescope.builtin").help_tags,   { noremap = true, silent = true } },
        { mode = "n",          "<leader>fb", require("telescope.builtin").buffers,     { noremap = true, silent = true } },
        { mode = "n",          "<leader>fk", require("telescope.builtin").keymaps,     { noremap = true, silent = true } },
        { mode = "n",          "<leader>fr", require("telescope.builtin").resume,      { noremap = true, silent = true } },
        { mode = "n",          "<leader>/",  require("telescope.builtin").live_grep,   { noremap = true, silent = true } },
        { mode = { "n", "v" }, "<leader>*",  require("telescope.builtin").grep_string, { noremap = true, silent = true } },
    },

    config = function()
        require("telescope").setup({
            pickers = {
                oldfiles = {
                    cwd_only = true,
                    cwd = vim.fn.getcwd(-1),
                },
                find_files = {
                    cwd = vim.fn.getcwd(-1),
                },
                live_grep = {
                    cwd = vim.fn.getcwd(-1),
                },
            },

            defaults = require('telescope.themes').get_ivy({
                file_ignore_patterns = {
                    "node_modules", "yarn.lock", "target", "dist",
                },

                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    }
                },

                sorting_strategy = "ascending",
            }),

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },

                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            }
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
    end
}
