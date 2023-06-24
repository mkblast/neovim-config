return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {'<leader><leader>', '<cmd>Telescope find_files<cr>'},
    {'<leader>fg', '<cmd>Telescope live_grep<cr>'},
    {'<leader>fh', '<cmd>Telescope help_tags<cr>'},
    {'<leader>fb', '<cmd>Telescope buffers<cr>'},
    {'<leader>fp', '<cmd>Telescope projects<cr>'},
    {'<leader>fd', '<cmd>Telescope diagnostics<cr>'},
    {'<leader>fk', '<cmd>Telescope keymaps<cr>'},
    {'<leader>ts', '<cmd>Telescope treesitter<cr>'},
  },
  config = function()
    require('telescope').load_extension('projects')
  end
}
