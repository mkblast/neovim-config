return {
    'NeogitOrg/neogit',

    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
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
