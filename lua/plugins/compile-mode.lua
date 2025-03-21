return {
    "ej-shafran/compile-mode.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },

    keys = {
        { mode = "n", "mc", ":botright 6 :Compile<CR>",   { noremap = true, silent = true } },
        { mode = "n", "mr", ":botright 6 :Recompile<CR>", { noremap = true, silent = true } },
        { mode = "n", "mq", ":QuickfixErrors<CR>",        { noremap = true, silent = true } },
    },

    config = function()
        vim.g.compile_mode = {
            baleia_setup = true,
            default_command = "",
            input_word_completion = true,
            recompile_no_fail = true,
        }

        vim.api.nvim_create_autocmd("User", {
            pattern = "CompilationFinished",
            callback = function(event)
                if event.data.code ~= 0 then
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        if vim.api.nvim_win_get_buf(win) == event.data.bufnr then
                            vim.api.nvim_set_current_win(win)
                            vim.api.nvim_command("CompileNextError")
                            return
                        end
                    end
                end
            end
        })
    end
}
