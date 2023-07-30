return {
  'nvim-treesitter/nvim-treesitter',

  dependencies = {
    "HiPhish/nvim-ts-rainbow2"
  },

  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "c", "python", "javascript", "typescript", "html", "css", "lua", "bash", "vim", "go", "rust" },
      sync_install = true,

      highlight = {
        enable = true,
      },
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { 'jsx', 'cpp' },
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once
        strategy = require('ts-rainbow').strategy.global,
      }

    }
  end
}
