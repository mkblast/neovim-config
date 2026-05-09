return {
    "NeogitOrg/neogit",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "esmuellert/codediff.nvim",
    },

    keys = {
        { mode = "n", "<leader>ng", "<cmd>Neogit<CR>", { noremap = true, silent = true } }
    },

    opts = {
        integrations = {
            codediff = true,
        },
        kind = "replace"
    }
}
