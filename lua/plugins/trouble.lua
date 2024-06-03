return {
    "folke/trouble.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    keys = {
        { mode = "n", "<leader>xs", "<cmd>Trouble<cr>",                             { noremap = true, silent = true } },
        { mode = "n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",          { noremap = true, silent = true } },
        { mode = "n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>",              { noremap = true, silent = true } },
        { mode = "n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>",             { noremap = true, silent = true } },
        { mode = "n", "gR",         "<cmd>Trouble lsp_references toggle<cr>",       { noremap = true, silent = true } },
    },

    opts = {}
}
