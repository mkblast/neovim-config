return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {'<leader><leader>', '<cmd>Telescope find_files<cr>',  { noremap = true, silent = true } },
    {'<leader>fg',       '<cmd>Telescope live_grep<cr>',   { noremap = true, silent = true } },
    {'<leader>fh',       '<cmd>Telescope help_tags<cr>',   { noremap = true, silent = true } },
    {'<leader>fb',       '<cmd>Telescope buffers<cr>',     { noremap = true, silent = true } },
    {'<leader>fp',       '<cmd>Telescope projects<cr>',    { noremap = true, silent = true } },
    {'<leader>fd',       '<cmd>Telescope diagnostics<cr>', { noremap = true, silent = true } },
    {'<leader>fk',       '<cmd>Telescope keymaps<cr>',     { noremap = true, silent = true } },
    {'<leader>ts',       '<cmd>Telescope treesitter<cr>',  { noremap = true, silent = true } },
  },
  config = function()
    require('telescope').load_extension('projects')
  end
}
