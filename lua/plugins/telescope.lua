return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    keys = {
        { mode = "n", '<leader>fp', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true } },
        { mode = "n", '<leader>fh', '<cmd>Telescope help_tags<cr>',  { noremap = true, silent = true } },
        { mode = "n", '<leader>fb', '<cmd>Telescope buffers<cr>',    { noremap = true, silent = true } },
        { mode = "n", '<leader>fk', '<cmd>Telescope keymaps<cr>',    { noremap = true, silent = true } },
        { mode = "n", '<leader>fr', '<cmd>Telescope resume<cr>',     { noremap = true, silent = true } },

        { mode = "n", '<leader>/',  '<cmd>Telescope live_grep<cr>',  { noremap = true, silent = true } },
    },

    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules", "yarn.lock", "target"
                }
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },

                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },

            }
        }

        require('telescope').load_extension('fzf')
        require("telescope").load_extension("ui-select")
    end
}
