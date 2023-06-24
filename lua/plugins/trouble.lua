return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>",                       { noremap = true, silent = true } },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap = true, silent = true } },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  { noremap = true, silent = true } },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               { noremap = true, silent = true } },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              { noremap = true, silent = true } },
    { "gR",         "<cmd>TroubleToggle lsp_references<cr>",        { noremap = true, silent = true } },
  }
}
