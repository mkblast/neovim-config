return {
    "ellisonleao/gruvbox.nvim",

    priority = 1000,

    init = function()
        vim.o.background = "dark"

        require("gruvbox").setup({
            contrast = "hard",
        })

        vim.cmd("colorscheme gruvbox")
    end
}
