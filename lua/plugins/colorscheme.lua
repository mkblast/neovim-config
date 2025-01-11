return {
    "ellisonleao/gruvbox.nvim",

    priority = 1000,

    lazy = false,

    init = function()
        vim.o.background = "dark"

        require("gruvbox").setup({
            contrast = "hard",
            overrides = {
                LspReferenceText = { bg = "#3c3836" },
                LspReferenceRead = { bg = "#3c3836" },
                LspReferenceWrite = { bg = "#3c3836" }
            }
        })

        vim.cmd("colorscheme gruvbox")
    end
}
