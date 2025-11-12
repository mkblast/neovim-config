return {
    "ibhagwan/fzf-lua",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local fzf = require("fzf-lua")
        local actions = require("fzf-lua").actions

        local map = vim.keymap.set
        local default_opts = { noremap = true, silent = true }

        map("n", "<leader>fp", fzf.files, default_opts)
        map("n", "<leader>/", fzf.grep, default_opts)
        map("n", "<leader>*", fzf.grep_cword, default_opts)
        map("v", "<leader>*", fzf.grep_visual, default_opts)
        map("n", "<leader>fb", fzf.buffers, default_opts)
        map("n", "<leader>fh", fzf.helptags, default_opts)
        map("n", "<leader>fr", fzf.resume, default_opts)
        map("n", "<leader>fm", fzf.manpages, default_opts)
        map("n", "<leader>fk", fzf.keymaps, default_opts)

        fzf.setup({
            files    = {
                hidden  = false,
                fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules]],
            },
            keymap   = {
                builtin = {
                    true,
                    ["<C-d>"] = "preview-page-down",
                    ["<C-u>"] = "preview-page-up",
                },
                fzf = {
                    true,
                    ["ctrl-d"] = "preview-page-down",
                    ["ctrl-u"] = "preview-page-up",
                    ["ctrl-q"] = "select-all+accept",
                },
            },
            actions  = {
                files = {
                    ["enter"]  = actions.file_edit_or_qf,
                    ["ctrl-x"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["alt-q"]  = actions.file_sel_to_qf,
                },
            },
            defaults = { git_icons = true },
        })

        fzf.register_ui_select()
    end
}
