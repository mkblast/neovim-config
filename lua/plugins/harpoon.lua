return {
    "ThePrimeagen/harpoon",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { mode = "n", '<C-h>',     ':lua require("harpoon.ui").nav_file(1)<CR>',         { noremap = true, silent = true } },
        { mode = "n", '<C-j>',     ':lua require("harpoon.ui").nav_file(2)<CR>',         { noremap = true, silent = true } },
        { mode = "n", '<C-k>',     ':lua require("harpoon.ui").nav_file(3)<CR>',         { noremap = true, silent = true } },
        { mode = "n", '<C-l>',     ':lua require("harpoon.ui").nav_file(4)<CR>',         { noremap = true, silent = true } },
        { mode = "n", '<C-;>',     ':lua require("harpoon.ui").nav_file(5)<CR>',         { noremap = true, silent = true } },
        { mode = "n", '<leader>i', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true } },
        { mode = "n", '<leader>o', ':lua require("harpoon.mark").add_file()<CR>',        { noremap = true, silent = true } },
    },

    opts = {}
}
