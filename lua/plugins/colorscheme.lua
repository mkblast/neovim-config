return {
    "mkblast/gruvbox.nvim",

    priority = 1000,

    lazy = false,

    init = function()
        vim.o.background = "dark"

        require("gruvbox").setup({
            dim_inactive = false,
            transparent_mode = false,
            contrast = "hard",
        })

        vim.cmd("colorscheme gruvbox")
    end
}
