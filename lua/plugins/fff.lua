return {
    "dmtrKovalenko/fff.nvim",

    build  = function()
        require("fff.download").download_or_build_binary()
    end,

    lazy   = false,

    config = function()
        local fff = require("fff")

        fff.setup({
            base_path       = vim.fn.getcwd(),
            prompt_vim_mode = true,
            layout          = {
                prompt_position = 'top',
            },
            debug           = {
                enable      = true,
                show_scores = true,
            }
        })

        local map          = vim.keymap.set
        local default_opts = { noremap = true, silent = true }

        local function get_current_word()
            return table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")))
        end

        map("n", "<leader>f", function() fff.find_files() end, default_opts)
        map("n", "<leader>/", function() fff.live_grep() end, default_opts)

        map("n", "<leader>*", function()
            fff.live_grep({ query = vim.fn.expand("<cword>") })
        end, default_opts)

        map("v", "<leader>*", function()
            fff.live_grep({ query = get_current_word() })
        end, default_opts)
    end
}
