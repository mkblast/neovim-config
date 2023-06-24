return {
  'Mofiqul/vscode.nvim',

  config = function()
    vim.o.background = "dark"

    local c = require('vscode.colors').get_colors()
    require('vscode').setup({
      -- Alternatively set style in setup
      -- style = 'light'

      -- Enable transparent background
      transparent = true,

      -- Enable italic comment
      italic_comments = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

    })
    require('vscode').load()
  end

}
