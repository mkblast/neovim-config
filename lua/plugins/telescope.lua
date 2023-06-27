return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
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
  },

  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    require "project_nvim".setup {}
    require('telescope').load_extension('projects')
  end
}
