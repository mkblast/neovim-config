return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "debugloop/telescope-undo.nvim",
  },

  keys = {
    { mode = "n", '<leader><leader>', '<cmd>Telescope find_files<cr>',  { noremap = true, silent = true } },
    { mode = "n", '<leader>fg',       '<cmd>Telescope live_grep<cr>',   { noremap = true, silent = true } },
    { mode = "n", '<leader>fh',       '<cmd>Telescope help_tags<cr>',   { noremap = true, silent = true } },
    { mode = "n", '<leader>fb',       '<cmd>Telescope buffers<cr>',     { noremap = true, silent = true } },
    { mode = "n", '<leader>fp',       '<cmd>Telescope projects<cr>',    { noremap = true, silent = true } },
    { mode = "n", '<leader>fd',       '<cmd>Telescope diagnostics<cr>', { noremap = true, silent = true } },
    { mode = "n", '<leader>fk',       '<cmd>Telescope keymaps<cr>',     { noremap = true, silent = true } },
    { mode = "n", '<leader>ts',       '<cmd>Telescope treesitter<cr>',  { noremap = true, silent = true } },
    { mode = "n", "<leader>u",        "<cmd>Telescope undo<cr>",        { noremap = true, silent = true } }
  },

  config = function()
    require "project_nvim".setup {}
    require('telescope').load_extension('projects')
    require("telescope").load_extension("undo")
  end
}
