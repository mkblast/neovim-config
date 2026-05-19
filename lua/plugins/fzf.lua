return {
    "ibhagwan/fzf-lua",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local fzf = require("fzf-lua")
        local actions = require("fzf-lua").actions

        local map = vim.keymap.set
        local default_opts = { noremap = true, silent = true }

        local grep_opts = {
            "rg",
            "--follow",
            "--glob",
            '"!**/.git/*"',
            "--column",
            "--line-number",
            "--no-heading",
            "--color=always",
            "--smart-case",
            "--max-columns=4096",
            "-e",
        }

        map("n", "<leader>f", fzf.files, default_opts)
        map("n", "<leader>/", function() fzf.grep({ no_esc = true }) end, default_opts)
        map("n", "<leader>*", fzf.grep_cword, default_opts)
        map("v", "<leader>*", fzf.grep_visual, default_opts)
        map("n", "<leader>b", fzf.buffers, default_opts)
        map("n", "<leader>gh", fzf.helptags, default_opts)
        map("n", "<leader>gr", fzf.resume, default_opts)
        map("n", "<leader>gm", fzf.manpages, default_opts)
        map("n", "<leader>gk", fzf.keymaps, default_opts)

        -- Grep only opened files.
        map("n", "<leader>q", function()
            local paths = {}
            local buffers = vim.api.nvim_list_bufs()
            for _, bufnr in ipairs(buffers) do
                if vim.api.nvim_buf_is_loaded(bufnr) and vim.fn.buflisted(bufnr) == 1 then
                    local path = vim.api.nvim_buf_get_name(bufnr)
                    table.insert(paths, path)
                end
            end

            fzf.grep({ search_paths = paths })
        end
        , default_opts)

        map("v", "<leader>q", function()
            local paths = {}
            local buffers = vim.api.nvim_list_bufs()
            for _, bufnr in ipairs(buffers) do
                if vim.api.nvim_buf_is_loaded(bufnr) and vim.fn.buflisted(bufnr) == 1 then
                    local path = vim.api.nvim_buf_get_name(bufnr)
                    table.insert(paths, path)
                end
            end

            fzf.grep_visual({ search_paths = paths })
        end
        , default_opts)

        fzf.setup({
            { "max-perf", "hide" },
            files    = {
                hidden = false,
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
            winopts  = { preview = { delay = 250, default = 'bat_native' } },
            actions  = {
                files = {
                    ["enter"]  = FzfLua.actions.file_edit_or_qf,
                    ["ctrl-s"] = FzfLua.actions.file_split,
                    ["ctrl-v"] = FzfLua.actions.file_vsplit,
                    ["ctrl-t"] = FzfLua.actions.file_tabedit,
                    ["alt-q"]  = FzfLua.actions.file_sel_to_qf,
                    ["alt-Q"]  = FzfLua.actions.file_sel_to_ll,
                    ["alt-i"]  = FzfLua.actions.toggle_ignore,
                    ["alt-h"]  = FzfLua.actions.toggle_hidden,
                    ["alt-f"]  = FzfLua.actions.toggle_follow,
                },
            },
            defaults = { git_icons = false, file_icons = false },
        })

        fzf.register_ui_select()
    end
}
