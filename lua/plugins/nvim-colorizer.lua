return {
    "catgoose/nvim-colorizer.lua",

    event = "BufReadPre",

    opts = {
        filetypes = {},
        options = {
            parser = {
                html = true,
                css = true,
                javascriptreact = true,
                typescriptreact = true,
                tailwind = true,
            },
            mode = "background",
        },
    },
}
