return {
    "hiphish/rainbow-delimiters.nvim",

    config = function()
        require 'rainbow-delimiters.setup'.setup {
            blacklist = { "zig" },
        }
    end,
}
