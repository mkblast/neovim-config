return {
  'TimUntersberger/neogit',

  dependencies = 'nvim-lua/plenary.nvim',

  keys = {
    { mode = "n", "<leader>ng", "<cmd>Neogit<CR>", { noremap = true, silent = true } }
  },

  config = true
}
