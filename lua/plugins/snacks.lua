return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy     = false,
    opts     = {
        picker    = { enabled = true },
        quickfile = { enabled = true },
    },
    keys     = {
        { mode = "n", "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
    }
}
