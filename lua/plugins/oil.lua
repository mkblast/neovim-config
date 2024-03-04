return {
    'stevearc/oil.nvim',

    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "size",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        view_options = {
            is_always_hidden = function(name, bufnr)
                return vim.startswith(name, ".git")
            end,
        },
    }
}
