return {
    "mistweaverco/kulala.nvim",

    ft = "http",

    keys = {
        { mode = "n", "<leader>kk", function() require("kulala").jump_prev() end, { noremap = true, silent = true } },
        { mode = "n", "<leader>kj", function() require("kulala").jump_next() end, { noremap = true, silent = true } },
        { mode = "n", "<leader>kr", function() require("kulala").run() end,       { noremap = true, silent = true } },
        { mode = "n", "<leader>kc", function() require("kulala").close() end,     { noremap = true, silent = true } },
    },

    opts = {}
}
