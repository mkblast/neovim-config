return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-symbols.nvim'
  },

  keys = {
    { mode = "n", '<leader><leader>', '<cmd>Telescope find_files<cr>',  { noremap = true, silent = true } },
    { mode = "n", '<leader>fg',       '<cmd>Telescope live_grep<cr>',   { noremap = true, silent = true } },
    { mode = "n", '<leader>fh',       '<cmd>Telescope help_tags<cr>',   { noremap = true, silent = true } },
    { mode = "n", '<leader>fb',       '<cmd>Telescope buffers<cr>',     { noremap = true, silent = true } },
    { mode = "n", '<leader>fp',       '<cmd>Telescope projects<cr>',    { noremap = true, silent = true } },
    { mode = "n", '<leader>fd',       '<cmd>Telescope diagnostics<cr>', { noremap = true, silent = true } },
    { mode = "n", '<leader>fk',       '<cmd>Telescope keymaps<cr>',     { noremap = true, silent = true } },
    { mode = "n", '<leader>fs',       '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',  { noremap = true, silent = true } },
  },

  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          "node_modules", "yarn.lock", "target"
        }
      },
    }

    require "project_nvim".setup {}
    require('telescope').load_extension('projects')
  end
}
