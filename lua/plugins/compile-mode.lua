return {
    "ej-shafran/compile-mode.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "m00qek/baleia.nvim", opts = {} },
    },

    keys = {
        { mode = "n", "mc", ":botright 6 :Compile<CR>",   { noremap = true, silent = true } },
        { mode = "n", "mr", ":botright 6 :Recompile<CR>", { noremap = true, silent = true } },
        { mode = "n", "mq", ":QuickfixErrors<CR>",        { noremap = true, silent = true } },
    },

    config = function()
        local compile = require("compile-mode")

        vim.g.compile_mode = {
            baleia_setup          = true,
            default_command       = "",
            input_word_completion = true,
            recompile_no_fail     = true,
            bang_expansion        = true,
            use_pseudo_terminal   = true,
        }

        vim.api.nvim_create_autocmd("User", {
            pattern = "CompilationFinished",
            callback = function(event)
                if event.data.code ~= 0 then
                    vim.api.nvim_set_current_win(vim.fn.win_findbuf(event.data.bufnr)[1])
                    vim.api.nvim_command("CompileNextError")
                end
            end
        })
    end
}
