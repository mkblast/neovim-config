return {
    'dmtrKovalenko/fff.nvim',
    build = function()
        require("fff.download").download_or_build_binary()
    end,

    opts = {
        base_path = vim.fn.getcwd(),
        prompt = '> ',
        layout = {
            prompt_position = 'top',
        },
    },

    keys = {
        { mode = "n", "<leader>f", function() require("fff").find_files() end, },
        { mode = "n", "<leader>/", function() require("fff").live_grep({ grep = { modes = { "regex", "fuzzy", "plain" } } }) end, },
        { mode = "n", "<leader>*", function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end, },

        {
            mode = "v",
            "<leader>*",
            function()
                require('fff').live_grep({
                    query = table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")))
                })
            end,
        },
    },
}
