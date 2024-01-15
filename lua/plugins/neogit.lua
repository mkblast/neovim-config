return {
  'NeogitOrg/neogit',

  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },

  keys = {
    { mode = "n", "<leader>ng", "<cmd>Neogit<CR>", { noremap = true, silent = true } }
  },

  config = function()
    local neogit = require("neogit")

    neogit.setup {
      integrations = {
        telescope = true,
        diffview = true,
      },
    }
  end
}
