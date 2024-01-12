return {
  'Mofiqul/vscode.nvim',

  priority = 1000,

  config = function()
    vim.o.background = "dark"

    require('vscode').setup({
      -- Alternatively set style in setup
      -- style = 'light'

      -- Enable transparent background
      transparent = false,

      -- Enable italic comment
      italic_comments = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

    })
    require('vscode').load()
  end
}
