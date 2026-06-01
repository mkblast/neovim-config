return {
    "nvim-lualine/lualine.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config       = {
        options  = {
            icons_enabled        = true,
            theme                = "auto",
            transparent          = false,
            component_separators = { left = "•", right = "•" },
            section_separators   = { left = "", right = "" },
            globalstatus         = true,
        },

        sections = {
            lualine_c = {
                {
                    "filename",
                    show_filename_only = false,
                    newfile_status     = true,
                    path               = 1,
                },
            },
            lualine_x = {
                {
                    function()
                        return vim.fs.basename(vim.fn.getcwd())
                    end
                },
                'encoding',
                'fileformat',
                'filetype'
            },
        }
    }
}
