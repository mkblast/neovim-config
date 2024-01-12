return {
  'nvim-treesitter/nvim-treesitter',

  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "c", "python", "javascript", "typescript", "html", "css", "lua", "bash", "vim", "go", "rust" },
      sync_install = false,

      highlight = {
        enable = true,
      },
    }
  end
}
