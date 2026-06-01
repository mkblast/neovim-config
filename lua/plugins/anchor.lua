return {
    dir    = "~/Projects/code/anchor.nvim",

    name   = "anchor",

    keys   = {
        {
            mode = "n",
            "cd",
            function()
                if vim.bo.filetype == "oil" then
                    require("anchor").add_path(require("oil").get_current_dir())
                else
                    require("anchor").add_current_path()
                end
            end,
            { noremap = true, silent = true }
        },
        {
            mode = "n",
            "cl",
            function()
                local filepath = vim.api.nvim_buf_get_name(0)
                local path = vim.fs.dirname(filepath)
                require("anchor").add_path(path)
            end,
            { noremap = true, silent = true }
        },

        { mode = "n", "co", function () require("anchor").toggle_last() end, { noremap = true, silent = true } },
        { mode = "n", "cD", function () require("anchor").toggle_menu() end, { noremap = true, silent = true } },
    },

    config = function()
        local anchor = require("anchor")
        anchor.setup({})
        anchor.add_current_path()
    end
}
