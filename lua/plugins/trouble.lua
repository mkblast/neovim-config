return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { mode = "n", "<leader>xx", "<cmd>TroubleToggle<cr>",                       { noremap = true, silent = true } },
        { mode = "n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap = true, silent = true } },
        { mode = "n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  { noremap = true, silent = true } },
        { mode = "n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               { noremap = true, silent = true } },
        { mode = "n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              { noremap = true, silent = true } },
        { mode = "n", "gR",         "<cmd>TroubleToggle lsp_references<cr>",        { noremap = true, silent = true } },
    },

    opts = {}
}
