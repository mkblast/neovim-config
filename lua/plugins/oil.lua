return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
            },
            delete_to_trash = true,
        })
    end
}
