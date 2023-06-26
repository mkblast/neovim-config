return {
  'TimUntersberger/neogit',

  dependencies = 'nvim-lua/plenary.nvim',

  keys = {
    { mode = "n", "<leader>ng", "<cmd>Neogit kind=split<CR>", { noremap = true, silent = true } }
  },

  config = true
}
