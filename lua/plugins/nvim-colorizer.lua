return {
    "catgoose/nvim-colorizer.lua",

    event = "BufReadPre",

    opts = {
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        user_default_options = {
            mode = "background",
            tailwind = true,
        },
    },
}
