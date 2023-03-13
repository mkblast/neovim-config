local map = vim.api.nvim_set_keymap

map('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', { noremap = true })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
map('n', '<leader>fp', '<cmd>Telescope projects<cr>', { noremap = true })
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { noremap = true })
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { noremap = true })
map('n', '<leader>ts', '<cmd>Telescope treesitter<cr>', { noremap = true })

require('telescope').load_extension('projects')
--
-- require('telescope').setup {
--   pickers = {
--     find_files = {
--       disable_devicons = true
--     },
--   },
-- }
