return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { map = "n", "<leader>xx", "<cmd>TroubleToggle<cr>",                       { noremap = true, silent = true } },
    { map = "n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap = true, silent = true } },
    { map = "n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  { noremap = true, silent = true } },
    { map = "n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               { noremap = true, silent = true } },
    { map = "n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              { noremap = true, silent = true } },
    { map = "n", "gR",         "<cmd>TroubleToggle lsp_references<cr>",        { noremap = true, silent = true } },
  }
}
