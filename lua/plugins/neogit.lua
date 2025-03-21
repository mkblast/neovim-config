return {
    "NeogitOrg/neogit",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },

    keys = {
        { mode = "n", "<leader>ng", "<cmd>Neogit<CR>", { noremap = true, silent = true } }
    },

    opts = {
        integrations = {
        -- fzf_lua = true,
            diffview = true,
        },
        kind = "replace"
    }
}
