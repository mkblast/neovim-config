return {
    "NeogitOrg/neogit",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },

    keys = {
        { mode = "n", "<leader>ng", "<cmd>Neogit<CR>", { noremap = true, silent = true } }
    },

    opts = {
        integrations = {
            telescope = true,
            diffview = true,
        },
        kind = "replace"
    }
}
